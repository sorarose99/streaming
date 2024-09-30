import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/sport/domain/repository/sports_repository.dart';
import 'package:movies_app/sport/presentation/controllers/sport_bloc/sport_event.dart';
import 'package:movies_app/sport/presentation/controllers/sport_bloc/sport_state.dart';

class SportsBloc extends Bloc<SportsEvent, SportsState> {
  final SportsRepository repository;

  SportsBloc(this.repository) : super(SportsState.initial()) {
    on<GetLiveMatchesEvent>((event, emit) async {
      // Emit loading state
      emit(state.copyWith(status: RequestStatus.loading));

      // Fetch matches from repository
      final result = await repository.getLiveMatches();

      // Handle success or failure
      result.fold(
        (failure) => emit(state.copyWith(
            status: RequestStatus.error, errorMessage: failure.message)),
        (matches) => emit(state.copyWith(
            status: RequestStatus.loaded, liveMatches: matches)),
      );
    });
  }
}
