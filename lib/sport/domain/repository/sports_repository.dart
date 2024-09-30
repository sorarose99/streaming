
import 'package:dartz/dartz.dart';  
import 'package:movies_app/core/data/error/failure.dart';
import 'package:movies_app/sport/data/models/sport_model.dart';
import 'package:movies_app/sport/domain/entities/sport.dart';
import 'package:movies_app/sport/data/datasource/sports_remote_data_source.dart';

abstract class SportsRepository {
  Future<Either<Failure, List<Sport>>> getLiveMatches();
}
class SportsRepositoryImpl implements SportsRepository {
  final SportsRemoteDataSource remoteDataSource;

  SportsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Sport>>> getLiveMatches() async {
    try {
      // Fetch the list of SportModel from remote data source
      print('Fetching live matches from API...');
      final List<SportModel> sportModels = await remoteDataSource.getLiveMatches();
      
      // Debugging the fetched data
      print('Fetched SportModels: $sportModels');

      // Convert List<SportModel> to List<Sport>
      final List<Sport> sports = sportModels.map((sportModel) {
        print('Converting SportModel: $sportModel');
        
        return Sport(
          id: 0,  // Assuming ID is not needed from API (adjust if needed)
          name: '${sportModel.homeTeam} vs ${sportModel.awayTeam}', // Merge names
          matchTime: sportModel.matchTime,
          league: sportModel.league,
          status: sportModel.status,
          homeTeamLogo: sportModel.homeTeamLogo,
          awayTeamLogo: sportModel.awayTeamLogo,
       liveStreamUrl: sportModel.liveStreamUrl, homeTeam: sportModel.homeTeam, awayTeam:sportModel.awayTeam,
        );
      }).toList();
      
      // Debugging the final list of Sport
      print('Converted Sports: $sports');
      
      return Right(sports);
    } catch (error) {
      print('Error: $error');
      return Left(ServerFailure('Failed to fetch live matches'));
    }
  }
}
