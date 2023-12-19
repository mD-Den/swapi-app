import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:swapi_app/utils/local_data_store/local_data_store.dart';

part 'swapi_event.dart';
part 'swapi_state.dart';

final LocalDataStore store = LocalDataStore();

class SwapiBloc extends Bloc<SwapiEvent, SwapiState> {
  SwapiBloc()
      : super(SwapiInitial(
          loading: false,
          charactersFav: store.getCharacters(),
          starshipsFav: store.getStarships(),
          planetsFav: store.getPlanets(),
          characterData: [],
          starshipsData: [],
          planetsData: [],
        )) {
    on<StartLoadingEvent>(_onStartLoadingEvent);
    on<StopLoadingEvent>(_onStopLoadingEvent);
    on<ToggleFavouriteEvent>(_onToggleFavouriteEvent);
    on<SearchStarWarsData>(_onSearchStarWarsData);
    on<ChangeCharacterDataEvent>(_onChangeCharacterDataEvent);
    on<ChangeStarshipsDataEvent>(_onChangeStarshipsDataEvent);
    on<ChangePlanetsDataEvent>(_onChangePlanetsDataEvent);
  }

  FutureOr<void> _onStartLoadingEvent(
      StartLoadingEvent event, Emitter<SwapiState> emit) {
    emit(state.copyWith(loading: true));
  }

  FutureOr<void> _onStopLoadingEvent(
      StopLoadingEvent event, Emitter<SwapiState> emit) {
    emit(state.copyWith(loading: false));
  }

  FutureOr<void> _onSearchStarWarsData(
      SearchStarWarsData event, Emitter<SwapiState> emit) async {
    if (event.query.length < 2) {
      return;
    }
    add(StartLoadingEvent());

    final charactersResponse = await http
        .get(Uri.parse('https://swapi.dev/api/people/?search=${event.query}'));
    final peopleData = json.decode(charactersResponse.body)['results'] ?? [];

    final starshipsResponse = await http.get(
        Uri.parse('https://swapi.dev/api/starships/?search=${event.query}'));
    final starshipsData = json.decode(starshipsResponse.body)['results'] ?? [];

    final planetsResponse = await http
        .get(Uri.parse('https://swapi.dev/api/planets/?search=${event.query}'));
    final planetsData = json.decode(planetsResponse.body)['results'] ?? [];

    add(ChangeCharacterDataEvent(data: peopleData));
    add(ChangeStarshipsDataEvent(data: starshipsData));
    add(ChangePlanetsDataEvent(data: planetsData));

    add(StopLoadingEvent());
  }

  FutureOr<void> _onToggleFavouriteEvent(
      ToggleFavouriteEvent event, Emitter<SwapiState> emit) async {
    List<Map<String, dynamic>> tempList = [];

    if (event.type == 'character') {
      tempList = state.charactersFav.cast<Map<String, dynamic>>();
    } else if (event.type == 'starship') {
      tempList = state.starshipsFav.cast<Map<String, dynamic>>();
    } else if (event.type == 'planet') {
      tempList = state.planetsFav.cast<Map<String, dynamic>>();
    }

    var newFavourite = {'name': event.name, 'url': event.url};

    int index = tempList.indexWhere((item) => item['name'] == event.name);
    if (index != -1) {
      tempList.removeAt(index);
    } else {
      tempList.add(newFavourite);
    }

    if (event.type == 'character') {
      store.setCharacters(tempList);
      emit(state.copyWith(charactersFav: tempList));
    } else if (event.type == 'starship') {
      store.setStarships(tempList);
      emit(state.copyWith(starshipsFav: tempList));
    } else if (event.type == 'planet') {
      store.setPlanets(tempList);
      emit(state.copyWith(planetsFav: tempList));
    }
  }

  Icon getFavoriteIcon(String type, String name) {
    bool isFavorite = false;
    Color color = Colors.grey;

    bool containsFavorite(
        List<Map<String, dynamic>> favoritesList, String name) {
      return favoritesList.any((item) => item['name'] == name);
    }

    switch (type) {
      case 'character':
        isFavorite = containsFavorite(state.charactersFav, name);
        color = Colors.red;
        break;
      case 'starship':
        isFavorite = containsFavorite(state.starshipsFav, name);
        color = Colors.blue;
        break;
      case 'planet':
        isFavorite = containsFavorite(state.planetsFav, name);
        color = Colors.green;
        break;
    }
    return Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
        color: color);
  }

  FutureOr<void> _onChangeCharacterDataEvent(
      ChangeCharacterDataEvent event, Emitter<SwapiState> emit) {
    emit(state.copyWith(characterData: event.data));
  }

  FutureOr<void> _onChangeStarshipsDataEvent(
      ChangeStarshipsDataEvent event, Emitter<SwapiState> emit) {
    emit(state.copyWith(starshipsData: event.data));
  }

  FutureOr<void> _onChangePlanetsDataEvent(
      ChangePlanetsDataEvent event, Emitter<SwapiState> emit) {
    emit(state.copyWith(planetsData: event.data));
  }
}
