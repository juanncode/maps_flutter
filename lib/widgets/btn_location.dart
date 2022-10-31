import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_flutter/blocs/location/location_bloc.dart';
import 'package:maps_flutter/blocs/map/map_bloc.dart';
import 'package:maps_flutter/ui/custom_snackbar.dart';

class BtnLocation extends StatelessWidget {
  const BtnLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);


    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        maxRadius: 25,
        backgroundColor: Colors.white,
        child: IconButton(
          icon: const Icon(Icons.my_location_outlined),
          color: Colors.black,
          onPressed: (){
            final userLocation = locationBloc.state.lastKnowLocation;
            if (userLocation == null) {
              final snack = CustomSnackbar(message: "no hay ubicación");
              ScaffoldMessenger.of(context).showSnackBar(snack);
              return;
            };
            mapBloc.moveCamera(userLocation);
          },
        ),
      ),
    );
  }
}