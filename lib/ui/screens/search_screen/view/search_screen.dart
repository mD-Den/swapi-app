import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:swapi_app/ui/bloc/swapi_bloc.dart';
import 'package:swapi_app/ui/screens/favorite_screen/view/favorite_screen.dart';
import 'package:swapi_app/ui/screens/search_screen/widgets/search_result.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final swapiBloc = GetIt.I.get<SwapiBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwapiBloc, SwapiState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Star Wars Search'),
            actions: [
              IconButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => FavoriteScreen())),
                  icon: const Icon(
                    Icons.star,
                    size: 40,
                  ))
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (value) {
                    swapiBloc.add(SearchStarWarsData(query: value));
                  },
                  decoration: InputDecoration(
                    labelText: 'Search',
                    suffixIcon: state.loading
                        ? const CircularProgressIndicator()
                        : null,
                  ),
                ),
              ),
              SearchResult(
                state: state,
                swapiBloc: swapiBloc,
              ),
            ],
          ),
        );
      },
    );
  }
}
