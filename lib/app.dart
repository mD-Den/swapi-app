import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:swapi_app/ui/bloc/swapi_bloc.dart';
import 'package:swapi_app/ui/screens/search_screen/view/search_screen.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final swapiBloc = GetIt.I.get<SwapiBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => swapiBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Star Wars Search',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const SearchScreen(),
      ),
    );
  }
}
