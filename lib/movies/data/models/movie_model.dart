import 'package:movies_app/core/domain/entities/media.dart';
import 'package:movies_app/core/utils/functions.dart';

class MovieModel extends Media {
  const MovieModel({
    required super.tmdbID,
    required super.title,
    required super.posterUrl,
    required super.backdropUrl,
    required super.voteAverage,
    required super.releaseDate,
    required super.overview,
    required super.isMovie,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        tmdbID: json['tmdb_id'],
        title: json['title'] ?? '',
        posterUrl: getPosterUrl(json['poster_path']),
        backdropUrl: getPosterUrl(json['poster_path']),
        voteAverage: json['vote_average'] != null
            ? double.parse((json['vote_average']).toStringAsFixed(1))
            : 0.0,
        releaseDate: getDate(json['release_date']),
        overview: json['overview'] ?? '',
        isMovie: true,
      );
}
