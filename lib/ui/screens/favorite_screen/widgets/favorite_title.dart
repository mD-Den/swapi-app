import 'package:flutter/material.dart';

class FavoriteTitle extends StatelessWidget {
  const FavoriteTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title:',
      style: const TextStyle(fontSize: 40),
    );
  }
}
