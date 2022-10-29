part of 'location_bloc.dart';

class LocationState extends Equatable {

  final bool followingUser;
  final LatLng? lastKnowLocation;
  final List<LatLng> myLocationHistory;

  const LocationState({
    this.followingUser = false,
    this.lastKnowLocation,
    this.myLocationHistory = const []
  });

  LocationState initState() => const LocationState();

  LocationState copyWith({
    bool? followingUser,
    LatLng? lastKnowLocation,
    List<LatLng>? myLocationHistory}
  ) => LocationState(
    followingUser: followingUser ?? this.followingUser,
    lastKnowLocation: lastKnowLocation ?? this.lastKnowLocation,
    myLocationHistory: myLocationHistory ?? this.myLocationHistory,
  );
  
  @override
  List<Object?> get props => [followingUser, lastKnowLocation, myLocationHistory];
}
