part of 'swapi_bloc.dart';

class SwapiState {
  final bool loading;
  List<Map<String, dynamic>> charactersFav;
  List<Map<String, dynamic>> starshipsFav;
  List<Map<String, dynamic>> planetsFav;
  List characterData;
  List starshipsData;
  List planetsData;

  SwapiState({
    required this.loading,
    required this.charactersFav,
    required this.starshipsFav,
    required this.planetsFav,
    required this.characterData,
    required this.starshipsData,
    required this.planetsData,
  });

  SwapiState copyWith({
    bool? loading,
    List<Map<String, dynamic>>? charactersFav,
    List<Map<String, dynamic>>? starshipsFav,
    List<Map<String, dynamic>>? planetsFav,
    List? characterData,
    List? starshipsData,
    List? planetsData,
  }) {
    return SwapiState(
      loading: loading ?? this.loading,
      charactersFav: charactersFav ?? this.charactersFav,
      starshipsFav: starshipsFav ?? this.starshipsFav,
      planetsFav: planetsFav ?? this.planetsFav,
      characterData: characterData ?? this.characterData,
      starshipsData: starshipsData ?? this.starshipsData,
      planetsData: planetsData ?? this.planetsData,
    );
  }
}

class SwapiInitial extends SwapiState {
  SwapiInitial({
    required super.loading,
    required super.charactersFav,
    required super.starshipsFav,
    required super.planetsFav,
    required super.characterData,
    required super.starshipsData,
    required super.planetsData,
  });
}
