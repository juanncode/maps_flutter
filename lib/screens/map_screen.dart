import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_flutter/blocs/location/location_bloc.dart';
import 'package:maps_flutter/views/map_view.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  late LocationBloc locationBloc = BlocProvider.of<LocationBloc>(context);

  @override
  void initState() {
    super.initState();
    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if(state.lastKnowLocation == null) return const Center(child: Text('Espere por favor...'));

          return SingleChildScrollView(
            child: Stack(
              children: [
                MapView(initialLocation: state.lastKnowLocation!),
                
          
              ],
            ),
          );
        },
      ),
    );
  }
}