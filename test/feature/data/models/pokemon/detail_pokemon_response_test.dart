import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/features/data/models/pokemon/detail_pokemon_response.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  final jsonData = json.decode(fixture('detail_pokemon_response.json'));

  group('DetailPokemonResponse', () {
    final tModel = DetailPokemonResponse.fromJson(jsonData);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.abilities,
            tModel.baseExperience,
            tModel.forms,
            tModel.gameIndices,
            tModel.height,
            tModel.heldItems,
            tModel.id,
            tModel.isDefault,
            tModel.locationAreaEncounters,
            tModel.moves,
            tModel.name,
            tModel.order,
            tModel.pastTypes,
            tModel.species,
            tModel.sprites,
            tModel.stats,
            tModel.types,
            tModel.weight,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'DetailPokemonResponse{abilities: ${tModel.abilities}, baseExperience: ${tModel.baseExperience}, forms: ${tModel.forms}, gameIndices: ${tModel.gameIndices}, height: ${tModel.height}, heldItems: ${tModel.heldItems}, id: ${tModel.id}, isDefault: ${tModel.isDefault}, locationAreaEncounters: ${tModel.locationAreaEncounters}, moves: ${tModel.moves}, name: ${tModel.name}, order: ${tModel.order}, pastTypes: ${tModel.pastTypes}, species: ${tModel.species}, sprites: ${tModel.sprites}, stats: ${tModel.stats}, types: ${tModel.types}, weight: ${tModel.weight}}',
        );
      },
    );

    test(
      'make sure fromJson function return DetailPokemonResponse',
      () async {
        // act
        final actualModel = DetailPokemonResponse.fromJson(jsonData);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = DetailPokemonResponse.fromJson(jsonData);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('Ability', () {
    final tModel = Ability.fromJson(jsonData['abilities'][0]);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.ability,
            tModel.isHidden,
            tModel.slot,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'Ability{ability: ${tModel.ability}, isHidden: ${tModel.isHidden}, slot: ${tModel.slot}}',
        );
      },
    );

    test(
      'make sure fromJson function return Ability model',
      () async {
        // act
        final actualModel = Ability.fromJson(jsonData['abilities'][0]);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = Ability.fromJson(jsonData['abilities'][0]);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('Species', () {
    final tModel = Species.fromJson(jsonData['species']);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.name,
            tModel.url,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'Species{name: ${tModel.name}, url: ${tModel.url}}',
        );
      },
    );

    test(
      'make sure fromJson function return Species model',
      () async {
        // act
        final actualModel = Species.fromJson(jsonData['species']);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = Species.fromJson(jsonData['species']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('GameIndex', () {
    final tModel = GameIndex.fromJson(jsonData['game_indices'][0]);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.gameIndex,
            tModel.version,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'GameIndex{gameIndex: ${tModel.gameIndex}, version: ${tModel.version}}',
        );
      },
    );

    test(
      'make sure fromJson function return GameIndex model',
      () async {
        // act
        final actualModel = GameIndex.fromJson(jsonData['game_indices'][0]);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = GameIndex.fromJson(jsonData['game_indices'][0]);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('Move', () {
    final tModel = Move.fromJson(jsonData['moves'][0]);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.move,
            tModel.versionGroupDetails,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'Move{move: ${tModel.move}, versionGroupDetails: ${tModel.versionGroupDetails}}',
        );
      },
    );

    test(
      'make sure fromJson function return Move model',
      () async {
        // act
        final actualModel = Move.fromJson(jsonData['moves'][0]);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = Move.fromJson(jsonData['moves'][0]);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('VersionGroupDetail', () {
    final tModel = VersionGroupDetail.fromJson(jsonData['moves'][0]['version_group_details'][0]);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.levelLearnedAt,
            tModel.moveLearnMethod,
            tModel.versionGroup,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'VersionGroupDetail{levelLearnedAt: ${tModel.levelLearnedAt}, moveLearnMethod: ${tModel.moveLearnMethod}, versionGroup: ${tModel.versionGroup}}',
        );
      },
    );

    test(
      'make sure fromJson function return VersionGroupDetail model',
      () async {
        // act
        final actualModel = VersionGroupDetail.fromJson(jsonData['moves'][0]['version_group_details'][0]);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = VersionGroupDetail.fromJson(jsonData['moves'][0]['version_group_details'][0]);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('GenerationV', () {
    final tModel = GenerationV.fromJson(jsonData['sprites']['versions']['generation-v']);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.blackWhite,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'GenerationV{blackWhite: ${tModel.blackWhite}}',
        );
      },
    );

    test(
      'make sure fromJson function return GenerationV model',
      () async {
        // act
        final actualModel = GenerationV.fromJson(jsonData['sprites']['versions']['generation-v']);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = GenerationV.fromJson(jsonData['sprites']['versions']['generation-v']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('GenerationIv', () {
    final tModel = GenerationIv.fromJson(jsonData['sprites']['versions']['generation-iv']);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.diamondPearl,
            tModel.heartgoldSoulsilver,
            tModel.platinum,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'GenerationIv{diamondPearl: ${tModel.diamondPearl}, heartgoldSoulsilver: ${tModel.heartgoldSoulsilver}, platinum: ${tModel.platinum}}',
        );
      },
    );

    test(
      'make sure fromJson function return GenerationIv model',
      () async {
        // act
        final actualModel = GenerationIv.fromJson(jsonData['sprites']['versions']['generation-iv']);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = GenerationIv.fromJson(jsonData['sprites']['versions']['generation-iv']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('Versions', () {
    final tModel = Versions.fromJson(jsonData['sprites']['versions']);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.generationI,
            tModel.generationIi,
            tModel.generationIii,
            tModel.generationIv,
            tModel.generationV,
            tModel.generationVi,
            tModel.generationVii,
            tModel.generationViii,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'Versions{generationI: ${tModel.generationI}, generationIi: ${tModel.generationIi}, generationIii: ${tModel.generationIii}, generationIv: ${tModel.generationIv}, generationV: ${tModel.generationV}, generationVi: ${tModel.generationVi}, generationVii: ${tModel.generationVii}, generationViii: ${tModel.generationViii}}',
        );
      },
    );

    test(
      'make sure fromJson function return Versions model',
      () async {
        // act
        final actualModel = Versions.fromJson(jsonData['sprites']['versions']);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = Versions.fromJson(jsonData['sprites']['versions']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('Sprites', () {
    final tModel = Sprites.fromJson(jsonData['sprites']);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.backDefault,
            tModel.backFemale,
            tModel.backShiny,
            tModel.backShinyFemale,
            tModel.frontDefault,
            tModel.frontFemale,
            tModel.frontShiny,
            tModel.frontShinyFemale,
            tModel.other,
            tModel.versions,
            tModel.animated,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'Sprites{backDefault: ${tModel.backDefault}, backFemale: ${tModel.backFemale}, backShiny: ${tModel.backShiny}, backShinyFemale: ${tModel.backShinyFemale}, frontDefault: ${tModel.frontDefault}, frontFemale: ${tModel.frontFemale}, frontShiny: ${tModel.frontShiny}, frontShinyFemale: ${tModel.frontShinyFemale}, other: ${tModel.other}, versions: ${tModel.versions}, animated: ${tModel.animated}}',
        );
      },
    );

    test(
      'make sure fromJson function return Sprites model',
      () async {
        // act
        final actualModel = Sprites.fromJson(jsonData['sprites']);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = Sprites.fromJson(jsonData['sprites']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('GenerationI', () {
    final tModel = GenerationI.fromJson(jsonData['sprites']['versions']['generation-i']);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.redBlue,
            tModel.yellow,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'GenerationI{redBlue: ${tModel.redBlue}, yellow: ${tModel.yellow}}',
        );
      },
    );

    test(
      'make sure fromJson function return GenerationI model',
      () async {
        // act
        final actualModel = GenerationI.fromJson(jsonData['sprites']['versions']['generation-i']);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = GenerationI.fromJson(jsonData['sprites']['versions']['generation-i']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('RedBlue', () {
    final tModel = RedBlue.fromJson(jsonData['sprites']['versions']['generation-i']['red-blue']);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.backDefault,
            tModel.backGray,
            tModel.backTransparent,
            tModel.frontDefault,
            tModel.frontGray,
            tModel.frontTransparent,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'RedBlue{backDefault: ${tModel.backDefault}, backGray: ${tModel.backGray}, backTransparent: ${tModel.backTransparent}, frontDefault: ${tModel.frontDefault}, frontGray: ${tModel.frontGray}, frontTransparent: ${tModel.frontTransparent}}',
        );
      },
    );

    test(
      'make sure fromJson function return RedBlue model',
      () async {
        // act
        final actualModel = RedBlue.fromJson(jsonData['sprites']['versions']['generation-i']['red-blue']);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = RedBlue.fromJson(jsonData['sprites']['versions']['generation-i']['red-blue']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('GenerationIi', () {
    final tModel = GenerationIi.fromJson(jsonData['sprites']['versions']['generation-ii']);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.crystal,
            tModel.gold,
            tModel.silver,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'GenerationIi{crystal: ${tModel.crystal}, gold: ${tModel.gold}, silver: ${tModel.silver}}',
        );
      },
    );

    test(
      'make sure fromJson function return GenerationIi model',
      () async {
        // act
        final actualModel = GenerationIi.fromJson(jsonData['sprites']['versions']['generation-ii']);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = GenerationIi.fromJson(jsonData['sprites']['versions']['generation-ii']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('Crystal', () {
    final tModel = Crystal.fromJson(jsonData['sprites']['versions']['generation-ii']['crystal']);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.backDefault,
            tModel.backShiny,
            tModel.backShinyTransparent,
            tModel.backTransparent,
            tModel.frontDefault,
            tModel.frontShiny,
            tModel.frontShinyTransparent,
            tModel.frontTransparent,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'Crystal{backDefault: ${tModel.backDefault}, backShiny: ${tModel.backShiny}, backShinyTransparent: ${tModel.backShinyTransparent}, backTransparent: ${tModel.backTransparent}, frontDefault: ${tModel.frontDefault}, frontShiny: ${tModel.frontShiny}, frontShinyTransparent: ${tModel.frontShinyTransparent}, frontTransparent: ${tModel.frontTransparent}}',
        );
      },
    );

    test(
      'make sure fromJson function return Crystal model',
      () async {
        // act
        final actualModel = Crystal.fromJson(jsonData['sprites']['versions']['generation-ii']['crystal']);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = Crystal.fromJson(jsonData['sprites']['versions']['generation-ii']['crystal']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('Gold', () {
    final tModel = Gold.fromJson(jsonData['sprites']['versions']['generation-ii']['gold']);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.backDefault,
            tModel.backShiny,
            tModel.frontDefault,
            tModel.frontShiny,
            tModel.frontTransparent,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'Gold{backDefault: ${tModel.backDefault}, backShiny: ${tModel.backShiny}, frontDefault: ${tModel.frontDefault}, frontShiny: ${tModel.frontShiny}, frontTransparent: ${tModel.frontTransparent}}',
        );
      },
    );

    test(
      'make sure fromJson function return Gold model',
      () async {
        // act
        final actualModel = Gold.fromJson(jsonData['sprites']['versions']['generation-ii']['gold']);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = Gold.fromJson(jsonData['sprites']['versions']['generation-ii']['gold']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('GenerationIii', () {
    final tModel = GenerationIii.fromJson(jsonData['sprites']['versions']['generation-iii']);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.emerald,
            tModel.fireredLeafgreen,
            tModel.rubySapphire,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'GenerationIii{emerald: ${tModel.emerald}, fireredLeafgreen: ${tModel.fireredLeafgreen}, rubySapphire: ${tModel.rubySapphire}}',
        );
      },
    );

    test(
      'make sure fromJson function return GenerationIii model',
      () async {
        // act
        final actualModel = GenerationIii.fromJson(jsonData['sprites']['versions']['generation-iii']);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = GenerationIii.fromJson(jsonData['sprites']['versions']['generation-iii']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('OfficialArtwork', () {
    final tModel = OfficialArtwork.fromJson(jsonData['sprites']['versions']['generation-iii']['emerald']);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.frontDefault,
            tModel.frontShiny,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'OfficialArtwork{frontDefault: ${tModel.frontDefault}, frontShiny: ${tModel.frontShiny}}',
        );
      },
    );

    test(
      'make sure fromJson function return OfficialArtwork model',
      () async {
        // act
        final actualModel = OfficialArtwork.fromJson(jsonData['sprites']['versions']['generation-iii']['emerald']);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = OfficialArtwork.fromJson(jsonData['sprites']['versions']['generation-iii']['emerald']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('Home', () {
    final tModel = Home.fromJson(jsonData['sprites']['other']['home']);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.frontDefault,
            tModel.frontFemale,
            tModel.frontShiny,
            tModel.frontShinyFemale,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'Home{frontDefault: ${tModel.frontDefault}, frontFemale: ${tModel.frontFemale}, frontShiny: ${tModel.frontShiny}, frontShinyFemale: ${tModel.frontShinyFemale}}',
        );
      },
    );

    test(
      'make sure fromJson function return Home model',
      () async {
        // act
        final actualModel = Home.fromJson(jsonData['sprites']['other']['home']);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = Home.fromJson(jsonData['sprites']['other']['home']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('GenerationVii', () {
    final tModel = GenerationVii.fromJson(jsonData['sprites']['versions']['generation-vii']);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.icons,
            tModel.ultraSunUltraMoon,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'GenerationVii{icons: ${tModel.icons}, ultraSunUltraMoon: ${tModel.ultraSunUltraMoon}}',
        );
      },
    );

    test(
      'make sure fromJson function return GenerationVii model',
      () async {
        // act
        final actualModel = GenerationVii.fromJson(jsonData['sprites']['versions']['generation-vii']);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = GenerationVii.fromJson(jsonData['sprites']['versions']['generation-vii']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('DreamWorld', () {
    final tModel = DreamWorld.fromJson(jsonData['sprites']['other']['dream_world']);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.frontDefault,
            tModel.frontFemale,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'DreamWorld{frontDefault: ${tModel.frontDefault}, frontFemale: ${tModel.frontFemale}}',
        );
      },
    );

    test(
      'make sure fromJson function return DreamWorld model',
      () async {
        // act
        final actualModel = DreamWorld.fromJson(jsonData['sprites']['other']['dream_world']);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = DreamWorld.fromJson(jsonData['sprites']['other']['dream_world']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('GenerationViii', () {
    final tModel = GenerationViii.fromJson(jsonData['sprites']['versions']['generation-viii']);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.icons,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'GenerationViii{icons: ${tModel.icons}}',
        );
      },
    );

    test(
      'make sure fromJson function return GenerationViii model',
      () async {
        // act
        final actualModel = GenerationViii.fromJson(jsonData['sprites']['versions']['generation-viii']);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = GenerationViii.fromJson(jsonData['sprites']['versions']['generation-viii']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('OtherP', () {
    final tModel = OtherP.fromJson(jsonData['sprites']['other']);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.dreamWorld,
            tModel.home,
            tModel.officialArtwork,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'OtherP{dreamWorld: ${tModel.dreamWorld}, home: ${tModel.home}, officialArtwork: ${tModel.officialArtwork}}',
        );
      },
    );

    test(
      'make sure fromJson function return OtherP model',
      () async {
        // act
        final actualModel = OtherP.fromJson(jsonData['sprites']['other']);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = OtherP.fromJson(jsonData['sprites']['other']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('Stat', () {
    final tModel = Stat.fromJson(jsonData['stats'][0]);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.baseStat,
            tModel.effort,
            tModel.stat,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'Stat{baseStat: ${tModel.baseStat}, effort: ${tModel.effort}, stat: ${tModel.stat}}',
        );
      },
    );

    test(
      'make sure fromJson function return Stat model',
      () async {
        // act
        final actualModel = Stat.fromJson(jsonData['stats'][0]);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = Stat.fromJson(jsonData['stats'][0]);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('Type', () {
    final tModel = Type.fromJson(jsonData['types'][0]);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.slot,
            tModel.type,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'Type{slot: ${tModel.slot}, type: ${tModel.type}}',
        );
      },
    );

    test(
      'make sure fromJson function return Type model',
      () async {
        // act
        final actualModel = Type.fromJson(jsonData['types'][0]);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = Type.fromJson(jsonData['types'][0]);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('Animated', () {
    final tModel = Animated.fromJson(jsonData['sprites']['versions']['generation-v']['black-white']['animated']);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.backDefault,
            tModel.backFemale,
            tModel.backShiny,
            tModel.backShinyFemale,
            tModel.frontDefault,
            tModel.frontFemale,
            tModel.frontShiny,
            tModel.frontShinyFemale,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'Animated{backDefault: ${tModel.backDefault}, backFemale: ${tModel.backFemale}, backShiny: ${tModel.backShiny}, backShinyFemale: ${tModel.backShinyFemale}, frontDefault: ${tModel.frontDefault}, frontFemale: ${tModel.frontFemale}, frontShiny: ${tModel.frontShiny}, frontShinyFemale: ${tModel.frontShinyFemale}}',
        );
      },
    );

    test(
      'make sure fromJson function return Animated model',
      () async {
        // act
        final actualModel =
            Animated.fromJson(jsonData['sprites']['versions']['generation-v']['black-white']['animated']);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = Animated.fromJson(jsonData['sprites']['versions']['generation-v']['black-white']['animated']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });
}
