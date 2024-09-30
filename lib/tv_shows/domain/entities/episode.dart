import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  final int id;
  final int tmdbId;
  final int? seasonsId;
  final int episodeNumber;
  final int seasonNumber;
  final String name;
  final String runtime;
  final String stillPath;
  final String airDate;
  final String videoUrl;
  final String overview;
  final double voteAverage;
  final int voteCount;

  const Episode({
    required this.id,
    required this.tmdbId,
    required this.seasonsId,
    required this.episodeNumber,
    required this.seasonNumber,
    required this.name,
    required this.runtime,
    required this.stillPath,
    required this.airDate,
    required this.videoUrl,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        id,
        tmdbId,
        seasonsId,
        episodeNumber,
        seasonNumber,
        name,
        runtime,
        stillPath,
        airDate,
        videoUrl,
        overview,
        voteAverage,
        voteCount,
      ];
}
