import 'package:movies_app/sport/data/models/sport_model.dart';

class Sport {
  final int id;            // Unique identifier
  final String name;        // "Team A vs Team B"
  final String matchTime;   // Match start time
  final String league;      // League or competition name
  final String status;      // Match status (e.g., "Live", "Finished")
  final String homeTeamLogo; // Home team logo URL
  final String awayTeamLogo; // Away team logo URL
  final String liveStreamUrl; // URL for the live stream

  // Famous player images for home team and away team are optional
  final String homeTeam; 
  final String awayTeam;

  Sport({
    required this.id,
    required this.name,
    required this.matchTime,
    required this.league,
    required this.status,
    required this.homeTeamLogo,
    required this.awayTeamLogo,
    required this.homeTeam,
    required this.awayTeam,
    required this.liveStreamUrl,   // Adding live stream URL
  });

  // Factory method to create Sport entity from SportModel
  factory Sport.fromModel(SportModel model) {
    return Sport(
      id: 0,  // You can change how you generate or fetch IDs as per your app's logic
      name: '${model.homeTeam} vs ${model.awayTeam}',
      matchTime: model.matchTime,
      league: model.league,
      status: model.status,
      homeTeamLogo: model.homeTeamLogo,
      awayTeamLogo: model.awayTeamLogo,
    
      liveStreamUrl: model.liveStreamUrl, homeTeam: model.homeTeam, awayTeam: model.awayTeam,
    );
  }
}
