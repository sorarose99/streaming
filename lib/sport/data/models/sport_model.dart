class SportModel {
  final String homeTeam;
  final String awayTeam;
  final String matchTime;
  final String league;
  final String status;
  final String homeTeamLogo;
  final String awayTeamLogo;
  final String liveStreamUrl; // URL for the live stream

  SportModel({
    required this.homeTeam,
    required this.awayTeam,
    required this.matchTime,
    required this.league,
    required this.status,
    required this.homeTeamLogo,
    required this.awayTeamLogo,
    required this.liveStreamUrl,
  });

  factory SportModel.fromJson(Map<String, dynamic> json) {
    // Print the JSON to check structure
    print('SportModel JSON: $json');

    return SportModel(
      homeTeam: json['home_name'] ?? 'Unknown',      // Adjusted to match your JSON
      awayTeam: json['away_name'] ?? 'Unknown',      // Adjusted to match your JSON
      matchTime: json['date'] + ' ' + json['time'],  // Concatenate date and time
      league: json['league'] ?? 'Unknown',
      status: json['status'] ?? 'Unknown',
      homeTeamLogo: json['home_logo'] ?? '',         // Adjusted to match your JSON
      awayTeamLogo: json['away_logo'] ?? '',         // Adjusted to match your JSON
      liveStreamUrl: json['id'] ?? '',               // Assuming 'id' is the stream URL or use the correct field if it's different
    );
  }
}
