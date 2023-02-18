import 'package:flutter/material.dart';
import 'package:pokemon/core/util/shared_preferences_manager.dart';
import 'package:pokemon/features/data/models/pokemon/detail_pokemon_response.dart';
import 'package:pokemon/features/presentation/widgets/widget_loading_center.dart';
import 'package:pokemon/injection_container.dart';

class DetailPokemonPage extends StatefulWidget {
  static const routeName = 'detail-pokemon';

  final DetailPokemonResponse detailPokemonResponse;

  const DetailPokemonPage({
    super.key,
    required this.detailPokemonResponse,
  });

  @override
  State<DetailPokemonPage> createState() => _DetailPokemonPageState();
}

class _DetailPokemonPageState extends State<DetailPokemonPage> {
  final _sharedPreferencesManager = sl<SharedPreferencesManager>();
  final _sliverScrollController = ScrollController();

  late DetailPokemonResponse detailPokemonResponse;

  bool isWishlist = false;
  bool isPinned = false;

  @override
  void initState() {
    detailPokemonResponse = widget.detailPokemonResponse;
    isWishlist = _sharedPreferencesManager.getBool(detailPokemonResponse.name ?? '') ?? false;
    _sliverScrollController.addListener(() {
      if (_sliverScrollController.offset > 400) {
        setState(() {
          isPinned = true;
        });
      } else {
        setState(() {
          isPinned = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _sliverScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _sliverScrollController,
        slivers: <Widget>[
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: const Size(0, 20),
              child: Container(),
            ),
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.6,
            flexibleSpace: Stack(
              children: [
                if (isPinned == false)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        fit: BoxFit.contain,
                        detailPokemonResponse.sprites?.other?.home?.frontShiny ?? '',
                        frameBuilder: (_, image, loadingBuilder, __) {
                          if (loadingBuilder == null) {
                            return Container(
                              height: 50,
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
                            height: 50,
                            child: WidgetLoadingCenter(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? (loadingProgress.cumulativeBytesLoaded) / (loadingProgress.expectedTotalBytes ?? 0)
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                Positioned(
                  top: 70,
                  left: 170,
                  child: Text(
                    'Detail',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: InkWell(
                    onTap: () async {
                      isWishlist = !isWishlist;
                      await _sharedPreferencesManager.putBool(detailPokemonResponse.name ?? '', isWishlist);
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
                      child: Icon(
                        Icons.favorite,
                        color: isWishlist ? Colors.pink : Colors.grey,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -1,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.12,
                        child: Divider(
                          thickness: 3,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  detailPokemonResponse.name ?? '',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Height',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        detailPokemonResponse.height.toString(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.grey.shade700,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 25.0,
                  ),
                  Container(
                    height: 50,
                    width: 2,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 25.0,
                  ),
                  Column(
                    children: [
                      Text(
                        'Width',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        detailPokemonResponse.weight.toString(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.grey.shade700,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    height: 50,
                    width: 2,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 25.0,
                  ),
                  Column(
                    children: [
                      Text(
                        'Experience',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        detailPokemonResponse.baseExperience.toString(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.grey.shade700,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Text(
                  '- Moves -',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ...List.generate(detailPokemonResponse.moves?.length ?? 0, (index) {
                final item = detailPokemonResponse.moves![index];
                return Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: (index % 2 == 0) ? Colors.grey.shade400 : Colors.white,
                  ),
                  child: Text(
                    item.move?.name ?? '',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: (index % 2 == 0) ? Colors.white : Colors.grey.shade700,
                        ),
                  ),
                );
              }).toList()
            ]),
          )
        ],
      ),
    );
  }
}
