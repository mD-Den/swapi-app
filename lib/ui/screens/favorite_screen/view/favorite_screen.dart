import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:swapi_app/ui/screens/favorite_screen/widgets/favorite_list.dart';
import 'package:swapi_app/ui/screens/favorite_screen/widgets/favorite_title.dart';

import '../../../bloc/swapi_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  final swapiBloc = GetIt.I.get<SwapiBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwapiBloc, SwapiState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Favorite',
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  if (state.charactersFav.isEmpty &&
                      state.starshipsFav.isEmpty &&
                      state.planetsFav.isEmpty)
                    const Column(
                      children: [
                        SizedBox(
                          height: 190,
                        ),
                        Center(
                            child: Text(
                          'Nothing added to favourites',
                          style: TextStyle(fontSize: 50),
                          textAlign: TextAlign.center,
                        )),
                      ],
                    ),
                  if (state.charactersFav.isNotEmpty)
                    Column(
                      children: [
                        const FavoriteTitle(
                          title: 'Characters',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FavoriteList(
                          type: 'character',
                          favorites: state.charactersFav,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  if (state.starshipsData.isNotEmpty)
                    Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const FavoriteTitle(
                          title: 'Starships',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FavoriteList(
                          type: 'starship',
                          favorites: state.starshipsFav,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  if (state.planetsFav.isNotEmpty)
                    Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const FavoriteTitle(
                          title: 'Planets',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FavoriteList(
                          type: 'planet',
                          favorites: state.planetsFav,
                        ),
                        const Divider(),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
