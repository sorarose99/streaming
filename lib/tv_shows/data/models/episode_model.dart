import 'package:movies_app/core/utils/functions.dart';
import 'package:movies_app/tv_shows/domain/entities/episode.dart';

class EpisodeModel extends Episode {
  const EpisodeModel({
    required int id,
    required int tmdbId,
    required int? seasonsId,
    required int seasonNumber,
    required String stillPath,
    required int episodeNumber,
    required String name,
    required String airDate,
    required String overview,
    required String runtime,
    required double voteAverage,
    required int voteCount,
    required String videoUrl,
  }) : super(id: id, tmdbId: tmdbId, seasonsId: seasonsId, episodeNumber: episodeNumber,
   seasonNumber: seasonNumber, name:name, runtime: runtime, stillPath: stillPath, airDate: airDate, 
   videoUrl: videoUrl, overview: overview, voteAverage: voteAverage, voteCount: voteCount);

  
  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: json['id'],
      tmdbId: json['tmdb_id'],
      seasonsId: json['seasons_id'],
      seasonNumber: json['season_number'],
      episodeNumber: json['episode_number'],
      name: json['name'],
      airDate: json['air_date'],
      overview: json['overview'],
      runtime: getLength(json['runtime']),
      voteAverage: double.parse(json['vote_average']),
      voteCount: json['vote_count'],
      videoUrl: json['video_url'],
      stillPath: getPosterUrl(json['imdb_picture_url']),
    );
  }

  toJson() {}
}
