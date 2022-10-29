import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription? streamSubscription;

  LocationBloc() : super(const LocationState()) {
    on<OnStartFollowingUserEvent>((event, emit) {
      emit(state.copyWith(followingUser: true));
    });
    on<OnStopFollowingUserEvent>((event, emit) {
      emit(state.copyWith(followingUser: false));
    });
    on<LocationEvent>((event, emit) {
      
    });

    on<OnNewUserLocationEvent>((event, emit) {
      
      emit(state.copyWith(
        lastKnowLocation: event.newLocation,
        myLocationHistory: [...state.myLocationHistory, event.newLocation]
      ));

    });
  }

  Future getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    add(OnNewUserLocationEvent(newLocation: LatLng(position.latitude, position.longitude)));
  }

  void startFollowingUser() {
    add(OnStartFollowingUserEvent());
    streamSubscription = Geolocator.getPositionStream().listen((event) {
      final position = event;
      add(OnNewUserLocationEvent(newLocation: LatLng(position.latitude, position.longitude)));
    });
  }

  void stopFollowingUser() {
    add(OnStopFollowingUserEvent());
    streamSubscription?.cancel();
    print('Stop following user');
  }

  @override
  Future<void> close() {
    stopFollowingUser();
    return super.close();
  }
}
