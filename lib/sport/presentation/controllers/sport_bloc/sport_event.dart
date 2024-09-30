import 'package:equatable/equatable.dart';

abstract class SportsEvent extends Equatable {
  const SportsEvent();

  @override
  List<Object> get props => [];
}

class GetLiveMatchesEvent extends SportsEvent {
  // You can pass any parameters if needed
  const GetLiveMatchesEvent();
}
