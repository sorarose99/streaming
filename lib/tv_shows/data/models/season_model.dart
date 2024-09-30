import 'package:movies_app/core/utils/functions.dart';
import 'package:movies_app/tv_shows/domain/entities/season.dart';

class SeasonModel extends Season {
  const SeasonModel({
    required super.tmdbID,
    required super.name,
    required super.episodeCount,
    required super.airDate,
    required super.overview,
    required super.posterUrl,
    required super.seasonNumber,
  });

  factory SeasonModel.fromJson(Map<String, dynamic> json) {
    return SeasonModel(
      tmdbID: json['tmdb_id'],
      name: json['name'],
      //  json['season_number'].toString(),
      episodeCount: json['episode_count'],
      airDate: getDate(json['air_date']),
      overview: json['overview'] ?? '',
      posterUrl: getPosterUrl(json['imdb_picture_url']),
      seasonNumber: json['season_number'],
    );
  }

  toJson() {}
}
