import 'package:movies_app/core/domain/entities/media_details.dart';
import 'package:movies_app/core/utils/functions.dart';
import 'package:movies_app/movies/data/models/cast_model.dart';
import 'package:movies_app/movies/data/models/review_model.dart';
import 'package:movies_app/movies/domain/entities/cast.dart';
import 'package:movies_app/movies/domain/entities/review.dart';
import 'package:movies_app/tv_shows/data/models/genre_model.dart';
import 'package:movies_app/tv_shows/data/models/tv_show_model.dart';
import 'package:movies_app/tv_shows/data/models/episode_model.dart';
import 'package:movies_app/tv_shows/data/models/season_model.dart';

// ignore: must_be_immutable
class TVShowDetailsModel extends MediaDetails {
  TVShowDetailsModel({
    required super.tmdbID,
    required super.title,
    required super.posterUrl,
    required super.backdropUrl,
    required super.releaseDate,
    required super.lastEpisodeToAir,
    required super.genres,
    required super.overview,
    required super.voteAverage,
    required super.voteCount,
    required super.trailerUrl,
    required super.numberOfSeasons,
    required super.seasons,
    required super.similar,
    required List<Cast> cast,
    required List<Review> reviews, required super.mediaType,
  });

  factory TVShowDetailsModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> episodesJson = json['episodes'];
    final lastEpisodeJson = episodesJson.isNotEmpty ? episodesJson.last : null;
    final lastEpisodeToAir =
        lastEpisodeJson != null ? EpisodeModel.fromJson(lastEpisodeJson) : null;

    return TVShowDetailsModel(
      tmdbID: json['tmdb_id'],
      title: json['name'],
      posterUrl: getPosterUrl(json['poster_path']),
      backdropUrl: getPosterUrl(json['poster_path']),
      releaseDate: getDate(json['first_air_date']),
      lastEpisodeToAir: lastEpisodeToAir,
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => GenreModel.fromJson(e))
              .toList() ??
          [],
      
      // getGenres(json['genres']),
      numberOfSeasons: json['seasons'].length,
      voteAverage: double.parse(json['vote_average']),
      voteCount: getVotesCount(json['vote_count']),
      overview: json['overview'],
      trailerUrl: lastEpisodeToAir?.videoUrl ?? '',
      seasons: List<SeasonModel>.from(
          json['seasons'].map((season) => SeasonModel.fromJson(season))),
      cast: (json['cast'] as List<dynamic>?)
              ?.map((e) => CastModel.fromJson(e))
              .toList() ??
          [],
      reviews: (json['reviews'] as List?)
              ?.map((e) => ReviewModel.fromJson(e))
              .toList() ??
          [],
      similar: List<TVShowModel>.from(
          json['similar_shows'].map((show) => TVShowModel.fromJson(show))), mediaType: MediaType.tvShow,
    );
  }
}

