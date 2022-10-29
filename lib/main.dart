import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_flutter/blocs/gps/gps_bloc.dart';
import 'package:maps_flutter/blocs/location/location_bloc.dart';
import 'package:maps_flutter/screens/loading_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => GpsBloc()),
      BlocProvider(create: (context) => LocationBloc()),
    ],
    child: MapsApp(),
  ));
}

class MapsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maps Flutter',
      home: LoadingScreen()
    );
  }
}