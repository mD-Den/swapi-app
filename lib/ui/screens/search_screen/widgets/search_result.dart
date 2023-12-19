import 'package:flutter/material.dart';
import 'package:swapi_app/ui/bloc/swapi_bloc.dart';
import 'package:swapi_app/ui/screens/search_screen/widgets/search_result_list_tile.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key, required this.state, required this.swapiBloc})
      : super(key: key);

  final SwapiState state;
  final SwapiBloc swapiBloc;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.characterData.length +
            state.starshipsData.length +
            state.planetsData.length,
        itemBuilder: (context, index) {
          String name;
          String type;
          String url;

          if (index < state.characterData.length) {
            name = state.characterData[index]['name'];
            url = state.characterData[index]['url'];
            type = 'character';
          } else if (index <
              state.characterData.length + state.starshipsData.length) {
            name =
                state.starshipsData[index - state.characterData.length]['name'];
            url =
                state.starshipsData[index - state.characterData.length]['url'];
            type = 'starship';
          } else if (index <
              state.characterData.length +
                  state.starshipsData.length +
                  state.planetsData.length) {
            name = state.planetsData[index -
                state.characterData.length -
                state.starshipsData.length]['name'];
            url = state.planetsData[index -
                state.characterData.length -
                state.starshipsData.length]['url'];
            type = 'planet';
          } else {
            // Если индекс выходит за пределы, возвращаем пустой контейнер
            return Container();
          }

          return SearchResultListTile(
              title: '$type: $name',
              icon: swapiBloc.getFavoriteIcon(type, name),
              onPressed: () => swapiBloc
                  .add(ToggleFavouriteEvent(type: type, name: name, url: url)));
        },
      ),
    );
  }
}
