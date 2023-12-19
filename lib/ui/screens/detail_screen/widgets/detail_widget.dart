import 'dart:developer';

import 'package:flutter/material.dart';

import 'detail_info_widget.dart';

class DetailWidget extends StatefulWidget {
  const DetailWidget({Key? key, required this.type, required this.data})
      : super(key: key);

  final String type;
  final Map<String, dynamic> data;
  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  List<Widget> infoWidgets = [];

  void foo() {
    switch (widget.type) {
      case 'character':
        infoWidgets.addAll([
          DetailInfoWidget(title: 'Name: ${widget.data['name']}'),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          DetailInfoWidget(title: 'Gender: ${widget.data['gender']}'),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          DetailInfoWidget(
              title: 'Starships Piloted: ${widget.data['starships'].length}'),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
        ]);
        break;
      case 'starship':
        infoWidgets.addAll([
          DetailInfoWidget(title: 'Name: ${widget.data['name']}'),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          DetailInfoWidget(title: 'Model: ${widget.data['model']}'),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          DetailInfoWidget(
              title: 'Manufacturer: ${widget.data['manufacturer']}'),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          DetailInfoWidget(title: 'Passengers: ${widget.data['passengers']}'),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
        ]);
        break;
      case 'planet':
        infoWidgets.addAll([
          DetailInfoWidget(title: 'Name: ${widget.data['name']}'),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          DetailInfoWidget(title: 'Diameter: ${widget.data['diameter']}'),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          DetailInfoWidget(title: 'Population: ${widget.data['population']}'),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
        ]);
        break;
    }
  }

  @override
  void initState() {
    log('${widget.data}');
    foo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(30),
        children: infoWidgets,
      ),
    );
  }
}
