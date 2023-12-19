import 'package:flutter/cupertino.dart';

import 'favorite_list_tile.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({
    Key? key,
    required this.type,
    required this.favorites,
  }) : super(key: key);

  final String type;
  final List<Map<String, dynamic>> favorites;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: favorites.length,
          itemBuilder: (ctx, index) {
            final item = favorites[index];
            return FavoriteListTile(
              favoriteName: item['name'] as String,
              favoriteUrl: item['url'] as String,
              type: type,
            );
          }),
    );
  }
}
