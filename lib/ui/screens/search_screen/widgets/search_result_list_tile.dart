import 'package:flutter/material.dart';

class SearchResultListTile extends StatelessWidget {
  const SearchResultListTile(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  final String title;
  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: IconButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
