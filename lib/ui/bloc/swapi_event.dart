part of 'swapi_bloc.dart';

@immutable
abstract class SwapiEvent {}

class StartLoadingEvent extends SwapiEvent {}

class StopLoadingEvent extends SwapiEvent {}

class ToggleFavouriteEvent extends SwapiEvent {
  final String type;
  final String name;
  final String url;

  ToggleFavouriteEvent({
    required this.type,
    required this.name,
    required this.url,
  });
}

class SearchStarWarsData extends SwapiEvent {
  final String query;

  SearchStarWarsData({required this.query});
}

class ChangeCharacterDataEvent extends SwapiEvent {
  final dynamic data;

  ChangeCharacterDataEvent({required this.data});
}

class ChangeStarshipsDataEvent extends SwapiEvent {
  final dynamic data;

  ChangeStarshipsDataEvent({required this.data});
}

class ChangePlanetsDataEvent extends SwapiEvent {
  final dynamic data;

  ChangePlanetsDataEvent({required this.data});
}

// Это событие Bloc для загрузки деталей
class LoadDetailsEvent extends SwapiEvent {
  final String name;
  final String type;

  LoadDetailsEvent({required this.name, required this.type});
}
