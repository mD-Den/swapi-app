import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:swapi_app/ui/bloc/swapi_bloc.dart';
import 'package:swapi_app/utils/local_data_store/local_data_store.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDataStore.init();
  GetIt.instance.registerSingleton<SwapiBloc>(SwapiBloc());
  runApp(MyApp());
}
