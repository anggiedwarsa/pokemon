import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/util/string_extension.dart';
import 'package:pokemon/features/presentation/bloc/detail_pokemon/detail_pokemon_bloc.dart';
import 'package:pokemon/features/presentation/widgets/widget_center_try_again.dart';
import 'package:pokemon/features/presentation/widgets/widget_loading_center.dart';
import 'package:pokemon/features/presentation/widgets/widget_primary_button.dart';
import 'package:pokemon/injection_container.dart';

class WidgetDetailPokemon extends StatefulWidget {
  final String name;

  const WidgetDetailPokemon({
    super.key,
    required this.name,
  });

  @override
  State<WidgetDetailPokemon> createState() => _WidgetDetailPokemonState();
}

class _WidgetDetailPokemonState extends State<WidgetDetailPokemon> {
  final _detailPokemonBloc = sl<DetailPokemonBloc>();

  @override
  void initState() {
    super.initState();
    _loadDetailPokemon();
  }

  @override
  void dispose() {
    _detailPokemonBloc.close();
    super.dispose();
  }

  void _loadDetailPokemon() {
    _detailPokemonBloc.add(LoadDetailPokemonEvent(
      name: widget.name,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      padding: EdgeInsets.all(16),
      child: BlocProvider(
        create: (context) => _detailPokemonBloc,
        child: BlocBuilder<DetailPokemonBloc, DetailPokemonState>(
          builder: (context, state) {
            if (state is DetailPokemonLoadingState) {
              return Container(
                height: 350,
                child: WidgetLoadingCenter(),
              );
            } else if (state is DetailPokemonFailureState) {
              final errorMessage = state.errorMessage?.convertErrorMessageToHumanMessage(context) ?? '';
              return WidgetCenterTryAgain(
                message: errorMessage.hideResponseCode(),
                onPressed: () => _loadDetailPokemon(),
              );
            } else if (state is DetailPokemonLoadedState) {
              final pokemon = state.detailPokemonResponse;
              return Container(
                height: 350,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 30,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.28),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 15),
                              ),
                            ],
                          ),
                        ),
                        Image.network(
                          fit: BoxFit.cover,
                          pokemon.sprites?.other?.home?.frontShiny ?? '',
                          height: 200,
                          frameBuilder: (_, image, loadingBuilder, __) {
                            if (loadingBuilder == null) {
                              return Container(
                                height: 200,
                                child: WidgetLoadingCenter(),
                              );
                            }
                            return image;
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Container(
                              height: 200,
                              child: WidgetLoadingCenter(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? (loadingProgress.cumulativeBytesLoaded) /
                                        (loadingProgress.expectedTotalBytes ?? 0)
                                    : null,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      (pokemon.name ?? '').toUpperCase(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    WidgetPrimaryButton(
                      onPressed: () {
                        Navigator.pop(context, pokemon);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48,
                        ),
                        child: Text('DETAIL'),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
