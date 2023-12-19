import 'package:flutter/material.dart';
import 'package:swapi_app/ui/screens/detail_screen/view/detail_screen.dart';

class FavoriteListTile extends StatelessWidget {
  const FavoriteListTile({
    Key? key,
    required this.favoriteName,
    required this.favoriteUrl,
    required this.type,
  }) : super(key: key);

  final String favoriteName;
  final String favoriteUrl;
  final String type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => DetailScreen(
                  url: favoriteUrl,
                  type: type,
                )));
      },
      child: Column(
        children: [
          Center(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: type == 'character'
                      ? Colors.red
                      : type == 'starship'
                          ? Colors.blue
                          : Colors.green,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    favoriteName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
