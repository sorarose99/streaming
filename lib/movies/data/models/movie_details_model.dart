import 'package:movies_app/core/domain/entities/media_details.dart';
import 'package:movies_app/core/utils/functions.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/review_model.dart';
import 'package:movies_app/movies/data/models/cast_model.dart';
import 'package:movies_app/tv_shows/data/models/genre_model.dart';

// ignore: must_be_immutable
class MovieDetailsModel extends MediaDetails {
  MovieDetailsModel({
    required super.tmdbID,
    required super.title,
    required super.posterUrl,
    required super.backdropUrl,
    required super.releaseDate,
    required super.genres,
    required super.runtime,
    required super.overview,
    required super.voteAverage,
    required super.voteCount,
    required super.trailerUrl,
    required super.cast,
    required super.reviews,
    required super.similar, required super.mediaType,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      tmdbID: json['tmdb_id'],
      title: json['title'],
      posterUrl: getPosterUrl(json['poster_path']),
      backdropUrl: getPosterUrl(json['poster_path']),
      releaseDate: getDate(json['release_date']),
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => GenreModel.fromJson(e))
              .toList() ??
          [],
      // (json['genres']),
      runtime: getLength(json['runtime']),
      overview: json['overview'] ?? '',
      voteAverage: double.parse((json['vote_average']).toStringAsFixed(1)),
      voteCount: getVotesCount(json['vote_count']),
      trailerUrl: json['videourl'],
      cast: (json['cast'] as List<dynamic>?)
              ?.map((e) => CastModel.fromJson(e))
              .toList() ??
          [],
      reviews: (json['reviews'] as List?)
              ?.map((e) => ReviewModel.fromJson(e))
              .toList() ??
          [],
      similar: (json['similar_movies'] as List?)
              ?.map((e) => MovieModel.fromJson(e))
              .toList() ??
          [],
           mediaType: MediaType.movie,
    );
  }
}
