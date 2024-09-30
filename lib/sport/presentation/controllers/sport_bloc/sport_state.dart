import 'package:equatable/equatable.dart';
import 'package:movies_app/sport/domain/entities/sport.dart'; // Use Sport instead of Match

enum RequestStatus { initial, loading, loaded, error }

class SportsState extends Equatable {
  final RequestStatus status;
  final List<Sport> liveMatches;  // Update this to List<Sport> for consistency
  final String errorMessage;

  const SportsState({
    required this.status,
    required this.liveMatches,
    this.errorMessage = '',
  });

  // Initial state factory
  factory SportsState.initial() {
    return const SportsState(
      status: RequestStatus.initial,
      liveMatches: [],
    );
  }

  // Copy with function to handle state transitions
  SportsState copyWith({
    RequestStatus? status,
    List<Sport>? liveMatches,  // Keep consistent with List<Sport>
    String? errorMessage,
  }) {
    return SportsState(
      status: status ?? this.status,
      liveMatches: liveMatches ?? this.liveMatches,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, liveMatches, errorMessage];
}
