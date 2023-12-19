import 'package:flutter/cupertino.dart';

class DetailInfoWidget extends StatelessWidget {
  const DetailInfoWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        height: 1.5,
        fontSize: 30,
      ),
    );
  }
}
