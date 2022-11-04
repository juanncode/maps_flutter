import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_flutter/blocs/map/map_bloc.dart';

class MapView extends StatelessWidget {
  final LatLng initialLocation;
  final Set<Polyline> polylines; 
  
  const MapView({Key? key, required this.initialLocation, required this.polylines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final size = MediaQuery.of(context).size;
    final CameraPosition initialCameraPosition = CameraPosition(target: initialLocation, zoom: 15);
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Listener(
        onPointerMove: (event) => mapBloc.add( OnStopFollowUserEvent()),
        child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          polylines: polylines,
          onMapCreated: (controller) {
            mapBloc.add(OnMapInitializeEvent(controller: controller));
          },
        ),
      ),
    );
  }
}