import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon/config/flavor_config.dart';
import 'package:pokemon/core/util/string_extension.dart';
import 'package:pokemon/core/util/styles/colors.dart';
import 'package:pokemon/features/data/models/result/result_response.dart';
import 'package:pokemon/features/presentation/bloc/list_pokemons/list_pokemons_bloc.dart';
import 'package:pokemon/features/presentation/pages/dashboard/widgets/widget_detail_pokemon.dart';
import 'package:pokemon/features/presentation/widgets/widget_center_try_again.dart';
import 'package:pokemon/features/presentation/widgets/widget_load_more_try_again.dart';
import 'package:pokemon/features/presentation/widgets/widget_loading_center.dart';
import 'package:pokemon/injection_container.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = 'dashboard';

  const DashboardPage({
    super.key,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _listPokemonsBloc = sl<ListPokemonsBloc>();
  final _pagingController = PagingController<int, ResultResponse?>(
    firstPageKey: 1,
    invisibleItemsThreshold: 1,
  );
  final _showPerPage = 20;

  bool _listDataLoaded = false;

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _loadData(pageKey);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _listPokemonsBloc.close();
  }

  void _loadData(int pageKey) {
    _listPokemonsBloc.add(LoadListPokemonsEvent(
      limit: _showPerPage.toString(),
      offset: (pageKey * _showPerPage).toString(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemons'),
      ),
      body: Center(
        child: BlocProvider<ListPokemonsBloc>(
          create: (context) => _listPokemonsBloc,
          child: BlocBuilder<ListPokemonsBloc, ListPokemonsState>(
            builder: (context, state) {
              if (state is ListPokemonsLoadingState) {
                _listDataLoaded = false;
              }
              if (state is ListPokemonsLoadedState) {
                final isLastPage = state.listPokemons.next == null;
                if (!_listDataLoaded) {
                  if (isLastPage) {
                    _pagingController.appendLastPage(state.listPokemons.results ?? []);
                  } else {
                    final nextPageKey = (_pagingController.nextPageKey ?? 1) + 1;
                    _pagingController.appendPage(state.listPokemons.results ?? [], nextPageKey);
                  }
                  _listDataLoaded = true;
                }
              }
              return Container(
                padding: EdgeInsets.all(16),
                child: PagedListView.separated(
                  pagingController: _pagingController,
                  separatorBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  builderDelegate: PagedChildBuilderDelegate<ResultResponse?>(
                    itemBuilder: (context, item, index) {
                      return InkWell(
                        onTap: () async {
                          await showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) => WidgetDetailPokemon(
                              name: item?.name ?? '',
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: BaseColor.materialcolor.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          child: Center(
                            child: Text(
                              (item?.name ?? '').toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    firstPageProgressIndicatorBuilder: (context) => Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: WidgetLoadingCenter(),
                    ),
                    newPageProgressIndicatorBuilder: (context) => WidgetLoadingCenter(),
                    firstPageErrorIndicatorBuilder: (context) {
                      return WidgetCenterTryAgain(
                        message: _pagingController.error
                            .toString()
                            .convertErrorMessageToHumanMessage(context)
                            .hideResponseCode(),
                        onPressed: () {
                          _loadData(1);
                        },
                      );
                    },
                    newPageErrorIndicatorBuilder: (context) => WidgetLoadMoreTryAgain(
                      onTap: () {
                        _pagingController.retryLastFailedRequest();
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
