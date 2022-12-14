part of 'map_bloc.dart';

class MapState extends Equatable {

  final bool isMapInitialized;
  final bool isFollowingUser;
  final Map<String, Polyline> polylines;

  const MapState( {this.isMapInitialized = false, this.isFollowingUser = true, this.polylines = const {} });
  
  MapState initialState() => MapState();

  MapState copyWith({
    bool? isMapInitialized,
    bool? isFollowingUser,
    Map<String, Polyline>? polylines,
  }) => MapState(
    isMapInitialized : isMapInitialized ?? this.isMapInitialized,
    isFollowingUser : isFollowingUser ?? this.isFollowingUser,
    polylines : polylines ?? this.polylines,
  );


  @override
  List<Object> get props => [isMapInitialized, isFollowingUser, polylines];
}

