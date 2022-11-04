import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_flutter/blocs/location/location_bloc.dart';
import 'package:maps_flutter/blocs/map/map_bloc.dart';
import 'package:maps_flutter/ui/custom_snackbar.dart';

class BtnFollowUser extends StatelessWidget {
  const BtnFollowUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        maxRadius: 25,
        backgroundColor: Colors.white,
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return IconButton(
              icon: Icon(state.isFollowingUser ? Icons.directions_run_rounded : Icons.hail_rounded),
              color: Colors.black,
              onPressed: () {
                state.isFollowingUser 
                  ? mapBloc.add(OnStopFollowUserEvent())
                  : mapBloc.add(OnStartFollowUserEvent());
              },
            );
          },
        ),
      ),
    );
  }
}
