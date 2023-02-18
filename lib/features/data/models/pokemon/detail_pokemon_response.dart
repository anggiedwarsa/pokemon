import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_pokemon_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class DetailPokemonResponse extends Equatable {
  @JsonKey(name: 'abilities')
  final List<Ability>? abilities;
  @JsonKey(name: 'base_experience')
  final int? baseExperience;
  @JsonKey(name: 'forms')
  final List<Species>? forms;
  @JsonKey(name: 'game_indices')
  final List<GameIndex>? gameIndices;
  @JsonKey(name: 'height')
  final int? height;
  @JsonKey(name: 'held_items')
  final List<dynamic>? heldItems;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'is_default')
  final bool? isDefault;
  @JsonKey(name: 'location_area_encounters')
  final String? locationAreaEncounters;
  @JsonKey(name: 'moves')
  final List<Move>? moves;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'order')
  final int? order;
  @JsonKey(name: 'past_types')
  final List<dynamic>? pastTypes;
  @JsonKey(name: 'species')
  final Species? species;
  @JsonKey(name: 'sprites')
  final Sprites? sprites;
  @JsonKey(name: 'stats')
  final List<Stat>? stats;
  @JsonKey(name: 'types')
  final List<Type>? types;
  @JsonKey(name: 'weight')
  final int? weight;

  DetailPokemonResponse({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  static DetailPokemonResponse fromJson(Map<String, dynamic> json) => _$DetailPokemonResponseFromJson(json);

  Map<String?, dynamic> toJson() => _$DetailPokemonResponseToJson(this);

  @override
  List<Object?> get props => [
        abilities,
        baseExperience,
        forms,
        gameIndices,
        height,
        heldItems,
        id,
        isDefault,
        locationAreaEncounters,
        moves,
        name,
        order,
        pastTypes,
        species,
        sprites,
        stats,
        types,
        weight,
      ];

  @override
  String toString() {
    return 'DetailPokemonResponse{abilities: $abilities, baseExperience: $baseExperience, forms: $forms, gameIndices: $gameIndices, height: $height, heldItems: $heldItems, id: $id, isDefault: $isDefault, locationAreaEncounters: $locationAreaEncounters, moves: $moves, name: $name, order: $order, pastTypes: $pastTypes, species: $species, sprites: $sprites, stats: $stats, types: $types, weight: $weight}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class Ability extends Equatable {
  @JsonKey(name: 'ability')
  final Species? ability;
  @JsonKey(name: 'is_hidden')
  final bool? isHidden;
  @JsonKey(name: 'slot')
  final int? slot;

  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  static Ability fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);

  Map<String?, dynamic> toJson() => _$AbilityToJson(this);

  @override
  List<Object?> get props => [
        ability,
        isHidden,
        slot,
      ];

  @override
  String toString() {
    return 'Ability{ability: $ability, isHidden: $isHidden, slot: $slot}';
  }
}

@JsonSerializable()
class Species extends Equatable {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'url')
  final String? url;

  Species({
    this.name,
    this.url,
  });

  static Species fromJson(Map<String, dynamic> json) => _$SpeciesFromJson(json);

  Map<String?, dynamic> toJson() => _$SpeciesToJson(this);

  @override
  List<Object?> get props => [
        name,
        url,
      ];

  @override
  String toString() {
    return 'Species{name: $name, url: $url}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class GameIndex extends Equatable {
  @JsonKey(name: 'game_index')
  final int? gameIndex;
  @JsonKey(name: 'version')
  final Species? version;

  GameIndex({
    this.gameIndex,
    this.version,
  });

  static GameIndex fromJson(Map<String, dynamic> json) => _$GameIndexFromJson(json);

  Map<String?, dynamic> toJson() => _$GameIndexToJson(this);

  @override
  List<Object?> get props => [
        gameIndex,
        version,
      ];

  @override
  String toString() {
    return 'GameIndex{gameIndex: $gameIndex, version: $version}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class Move extends Equatable {
  @JsonKey(name: 'move')
  final Species? move;
  @JsonKey(name: 'version_group_details')
  final List<VersionGroupDetail>? versionGroupDetails;

  Move({
    this.move,
    this.versionGroupDetails,
  });

  static Move fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);

  Map<String?, dynamic> toJson() => _$MoveToJson(this);

  @override
  List<Object?> get props => [
        move,
        versionGroupDetails,
      ];

  @override
  String toString() {
    return 'Move{move: $move, versionGroupDetails: $versionGroupDetails}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class VersionGroupDetail extends Equatable {
  @JsonKey(name: 'level_learned_at')
  final int? levelLearnedAt;
  @JsonKey(name: 'move_learn_method')
  final Species? moveLearnMethod;
  @JsonKey(name: 'version_group')
  final Species? versionGroup;

  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  static VersionGroupDetail fromJson(Map<String, dynamic> json) => _$VersionGroupDetailFromJson(json);

  Map<String?, dynamic> toJson() => _$VersionGroupDetailToJson(this);

  @override
  List<Object?> get props => [
        levelLearnedAt,
        moveLearnMethod,
        versionGroup,
      ];

  @override
  String toString() {
    return 'VersionGroupDetail{levelLearnedAt: $levelLearnedAt, moveLearnMethod: $moveLearnMethod, versionGroup: $versionGroup}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class GenerationV extends Equatable {
  @JsonKey(name: 'black-white')
  final Sprites? blackWhite;

  GenerationV({
    this.blackWhite,
  });

  static GenerationV fromJson(Map<String, dynamic> json) => _$GenerationVFromJson(json);

  Map<String?, dynamic> toJson() => _$GenerationVToJson(this);

  @override
  List<Object?> get props => [
        blackWhite,
      ];

  @override
  String toString() {
    return 'GenerationV{blackWhite: $blackWhite}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class GenerationIv extends Equatable {
  @JsonKey(name: 'diamond-pearl')
  final Sprites? diamondPearl;
  @JsonKey(name: 'heartgold-soulsilver')
  final Sprites? heartgoldSoulsilver;
  @JsonKey(name: 'platinum')
  final Sprites? platinum;

  GenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });

  static GenerationIv fromJson(Map<String, dynamic> json) => _$GenerationIvFromJson(json);

  Map<String?, dynamic> toJson() => _$GenerationIvToJson(this);

  @override
  List<Object?> get props => [
        diamondPearl,
        heartgoldSoulsilver,
        platinum,
      ];

  @override
  String toString() {
    return 'GenerationIv{diamondPearl: $diamondPearl, heartgoldSoulsilver: $heartgoldSoulsilver, platinum: $platinum}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class Versions extends Equatable {
  @JsonKey(name: 'generation-i')
  final GenerationI? generationI;
  @JsonKey(name: 'generation-ii')
  final GenerationIi? generationIi;
  @JsonKey(name: 'generation-iii')
  final GenerationIii? generationIii;
  @JsonKey(name: 'generation-iv')
  final GenerationIv? generationIv;
  @JsonKey(name: 'generation-v')
  final GenerationV? generationV;
  @JsonKey(name: 'generation-vi')
  final Map<String, Home>? generationVi;
  @JsonKey(name: 'generation-vii')
  final GenerationVii? generationVii;
  @JsonKey(name: 'generation-viii')
  final GenerationViii? generationViii;

  Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  static Versions fromJson(Map<String, dynamic> json) => _$VersionsFromJson(json);

  Map<String?, dynamic> toJson() => _$VersionsToJson(this);

  @override
  List<Object?> get props => [
        generationI,
        generationIi,
        generationIii,
        generationIv,
        generationV,
        generationVi,
        generationVii,
        generationViii,
      ];

  @override
  String toString() {
    return 'Versions{generationI: $generationI, generationIi: $generationIi, generationIii: $generationIii, generationIv: $generationIv, generationV: $generationV, generationVi: $generationVi, generationVii: $generationVii, generationViii: $generationViii}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class Sprites extends Equatable {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_female')
  final String? backFemale;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'back_shiny_female')
  final String? backShinyFemale;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;
  @JsonKey(name: 'other')
  final OtherP? other;
  @JsonKey(name: 'versions')
  final Versions? versions;
  @JsonKey(name: 'animated')
  final Animated? animated;

  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.versions,
    this.animated,
  });

  static Sprites fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);

  Map<String?, dynamic> toJson() => _$SpritesToJson(this);

  @override
  List<Object?> get props => [
        backDefault,
        backFemale,
        backShiny,
        backShinyFemale,
        frontDefault,
        frontFemale,
        frontShiny,
        frontShinyFemale,
        other,
        versions,
        animated,
      ];

  @override
  String toString() {
    return 'Sprites{backDefault: $backDefault, backFemale: $backFemale, backShiny: $backShiny, backShinyFemale: $backShinyFemale, frontDefault: $frontDefault, frontFemale: $frontFemale, frontShiny: $frontShiny, frontShinyFemale: $frontShinyFemale, other: $other, versions: $versions, animated: $animated}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class GenerationI extends Equatable {
  @JsonKey(name: 'red-blue')
  final RedBlue? redBlue;
  @JsonKey(name: 'yellow')
  final RedBlue? yellow;

  GenerationI({
    this.redBlue,
    this.yellow,
  });

  static GenerationI fromJson(Map<String, dynamic> json) => _$GenerationIFromJson(json);

  Map<String?, dynamic> toJson() => _$GenerationIToJson(this);

  @override
  List<Object?> get props => [
        redBlue,
        yellow,
      ];

  @override
  String toString() {
    return 'GenerationI{redBlue: $redBlue, yellow: $yellow}';
  }
}

@JsonSerializable()
class RedBlue extends Equatable {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_gray')
  final String? backGray;
  @JsonKey(name: 'back_transparent')
  final String? backTransparent;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_gray')
  final String? frontGray;
  @JsonKey(name: 'front_transparent')
  final String? frontTransparent;

  RedBlue({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  static RedBlue fromJson(Map<String, dynamic> json) => _$RedBlueFromJson(json);

  Map<String?, dynamic> toJson() => _$RedBlueToJson(this);

  @override
  List<Object?> get props => [
        backDefault,
        backGray,
        backTransparent,
        frontDefault,
        frontGray,
        frontTransparent,
      ];

  @override
  String toString() {
    return 'RedBlue{backDefault: $backDefault, backGray: $backGray, backTransparent: $backTransparent, frontDefault: $frontDefault, frontGray: $frontGray, frontTransparent: $frontTransparent}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class GenerationIi extends Equatable {
  @JsonKey(name: 'crystal')
  final Crystal? crystal;
  @JsonKey(name: 'gold')
  final Gold? gold;
  @JsonKey(name: 'silver')
  final Gold? silver;

  GenerationIi({
    this.crystal,
    this.gold,
    this.silver,
  });

  static GenerationIi fromJson(Map<String, dynamic> json) => _$GenerationIiFromJson(json);

  Map<String?, dynamic> toJson() => _$GenerationIiToJson(this);

  @override
  List<Object?> get props => [
        crystal,
        gold,
        silver,
      ];

  @override
  String toString() {
    return 'GenerationIi{crystal: $crystal, gold: $gold, silver: $silver}';
  }
}

@JsonSerializable()
class Crystal extends Equatable {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'back_shiny_transparent')
  final String? backShinyTransparent;
  @JsonKey(name: 'back_transparent')
  final String? backTransparent;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_transparent')
  final String? frontShinyTransparent;
  @JsonKey(name: 'front_transparent')
  final String? frontTransparent;

  Crystal({
    this.backDefault,
    this.backShiny,
    this.backShinyTransparent,
    this.backTransparent,
    this.frontDefault,
    this.frontShiny,
    this.frontShinyTransparent,
    this.frontTransparent,
  });

  static Crystal fromJson(Map<String, dynamic> json) => _$CrystalFromJson(json);

  Map<String?, dynamic> toJson() => _$CrystalToJson(this);

  @override
  List<Object?> get props => [
        backDefault,
        backShiny,
        backShinyTransparent,
        backTransparent,
        frontDefault,
        frontShiny,
        frontShinyTransparent,
        frontTransparent,
      ];

  @override
  String toString() {
    return 'Crystal{backDefault: $backDefault, backShiny: $backShiny, backShinyTransparent: $backShinyTransparent, backTransparent: $backTransparent, frontDefault: $frontDefault, frontShiny: $frontShiny, frontShinyTransparent: $frontShinyTransparent, frontTransparent: $frontTransparent}';
  }
}

@JsonSerializable()
class Gold extends Equatable {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_transparent')
  final String? frontTransparent;

  Gold({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  static Gold fromJson(Map<String, dynamic> json) => _$GoldFromJson(json);

  Map<String?, dynamic> toJson() => _$GoldToJson(this);

  @override
  List<Object?> get props => [
        backDefault,
        backShiny,
        frontDefault,
        frontShiny,
        frontTransparent,
      ];

  @override
  String toString() {
    return 'Gold{backDefault: $backDefault, backShiny: $backShiny, frontDefault: $frontDefault, frontShiny: $frontShiny, frontTransparent: $frontTransparent}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class GenerationIii extends Equatable {
  @JsonKey(name: 'emerald')
  final OfficialArtwork? emerald;
  @JsonKey(name: 'firered-leafgreen')
  final Gold? fireredLeafgreen;
  @JsonKey(name: 'ruby-sapphire')
  final Gold? rubySapphire;

  GenerationIii({
    this.emerald,
    this.fireredLeafgreen,
    this.rubySapphire,
  });

  static GenerationIii fromJson(Map<String, dynamic> json) => _$GenerationIiiFromJson(json);

  Map<String?, dynamic> toJson() => _$GenerationIiiToJson(this);

  @override
  List<Object?> get props => [
        emerald,
        fireredLeafgreen,
        rubySapphire,
      ];

  @override
  String toString() {
    return 'GenerationIii{emerald: $emerald, fireredLeafgreen: $fireredLeafgreen, rubySapphire: $rubySapphire}';
  }
}

@JsonSerializable()
class OfficialArtwork extends Equatable {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  OfficialArtwork({
    this.frontDefault,
    this.frontShiny,
  });

  static OfficialArtwork fromJson(Map<String, dynamic> json) => _$OfficialArtworkFromJson(json);

  Map<String?, dynamic> toJson() => _$OfficialArtworkToJson(this);

  @override
  List<Object?> get props => [
        frontDefault,
        frontShiny,
      ];

  @override
  String toString() {
    return 'OfficialArtwork{frontDefault: $frontDefault, frontShiny: $frontShiny}';
  }
}

@JsonSerializable()
class Home extends Equatable {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;

  Home({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  static Home fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);

  Map<String?, dynamic> toJson() => _$HomeToJson(this);

  @override
  List<Object?> get props => [
        frontDefault,
        frontFemale,
        frontShiny,
        frontShinyFemale,
      ];

  @override
  String toString() {
    return 'Home{frontDefault: $frontDefault, frontFemale: $frontFemale, frontShiny: $frontShiny, frontShinyFemale: $frontShinyFemale}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class GenerationVii extends Equatable {
  @JsonKey(name: 'icons')
  final DreamWorld? icons;
  @JsonKey(name: 'ultra-sun-ultra-moon')
  final Home? ultraSunUltraMoon;

  GenerationVii({
    this.icons,
    this.ultraSunUltraMoon,
  });

  static GenerationVii fromJson(Map<String, dynamic> json) => _$GenerationViiFromJson(json);

  Map<String?, dynamic> toJson() => _$GenerationViiToJson(this);

  @override
  List<Object?> get props => [
        icons,
        ultraSunUltraMoon,
      ];

  @override
  String toString() {
    return 'GenerationVii{icons: $icons, ultraSunUltraMoon: $ultraSunUltraMoon}';
  }
}

@JsonSerializable()
class DreamWorld extends Equatable {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;

  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  static DreamWorld fromJson(Map<String, dynamic> json) => _$DreamWorldFromJson(json);

  Map<String?, dynamic> toJson() => _$DreamWorldToJson(this);

  @override
  List<Object?> get props => [
        frontDefault,
        frontFemale,
      ];

  @override
  String toString() {
    return 'DreamWorld{frontDefault: $frontDefault, frontFemale: $frontFemale}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class GenerationViii extends Equatable {
  @JsonKey(name: 'icons')
  final DreamWorld? icons;

  GenerationViii({
    this.icons,
  });

  static GenerationViii fromJson(Map<String, dynamic> json) => _$GenerationViiiFromJson(json);

  Map<String?, dynamic> toJson() => _$GenerationViiiToJson(this);

  @override
  List<Object?> get props => [
        icons,
      ];

  @override
  String toString() {
    return 'GenerationViii{icons: $icons}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class OtherP extends Equatable {
  @JsonKey(name: 'dream_world')
  final DreamWorld? dreamWorld;
  @JsonKey(name: 'home')
  final Home? home;
  @JsonKey(name: 'official-artwork')
  final OfficialArtwork? officialArtwork;

  OtherP({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
  });

  static OtherP fromJson(Map<String, dynamic> json) => _$OtherPFromJson(json);

  Map<String?, dynamic> toJson() => _$OtherPToJson(this);

  @override
  List<Object?> get props => [
        dreamWorld,
        home,
        officialArtwork,
      ];

  @override
  String toString() {
    return 'OtherP{dreamWorld: $dreamWorld, home: $home, officialArtwork: $officialArtwork}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class Stat extends Equatable {
  @JsonKey(name: 'base_stat')
  final int? baseStat;
  @JsonKey(name: 'effort')
  final int? effort;
  @JsonKey(name: 'stat')
  final Species? stat;

  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  static Stat fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String?, dynamic> toJson() => _$StatToJson(this);

  @override
  List<Object?> get props => [
        baseStat,
        effort,
        stat,
      ];

  @override
  String toString() {
    return 'Stat{baseStat: $baseStat, effort: $effort, stat: $stat}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class Type extends Equatable {
  @JsonKey(name: 'slot')
  final int? slot;
  @JsonKey(name: 'type')
  final Species? type;

  Type({
    this.slot,
    this.type,
  });

  static Type fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String?, dynamic> toJson() => _$TypeToJson(this);

  @override
  List<Object?> get props => [
        slot,
        type,
      ];

  @override
  String toString() {
    return 'Type{slot: $slot, type: $type}';
  }
}

@JsonSerializable()
class Animated extends Equatable {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_female')
  final String? backFemale;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'back_shiny_female')
  final String? backShinyFemale;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;

  Animated({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  static Animated fromJson(Map<String, dynamic> json) => _$AnimatedFromJson(json);

  Map<String?, dynamic> toJson() => _$AnimatedToJson(this);

  @override
  List<Object?> get props => [
        backDefault,
        backFemale,
        backShiny,
        backShinyFemale,
        frontDefault,
        frontFemale,
        frontShiny,
        frontShinyFemale,
      ];

  @override
  String toString() {
    return 'Animated{backDefault: $backDefault, backFemale: $backFemale, backShiny: $backShiny, backShinyFemale: $backShinyFemale, frontDefault: $frontDefault, frontFemale: $frontFemale, frontShiny: $frontShiny, frontShinyFemale: $frontShinyFemale}';
  }
}
