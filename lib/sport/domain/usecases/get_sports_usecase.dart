
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/data/error/failure.dart';
import 'package:movies_app/sport/domain/entities/sport.dart';
import 'package:movies_app/sport/domain/repository/sports_repository.dart';

class GetLiveSportsUseCase {
  final SportsRepository repository;

  GetLiveSportsUseCase(this.repository);

  Future<Either<Failure, List<Sport>>> call() async {
    return await repository.getLiveMatches();
  }
}
