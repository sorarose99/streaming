// import 'package:equatable/equatable.dart';

// class Cast extends Equatable {
//   final String name;
//   final String profileUrl;
//   final int gender;

//   const Cast({
//     required this.name,
//     required this.profileUrl,
//     required this.gender,
//   });

//   @override
//   List<Object?> get props => [
//         name,
//         profileUrl,
//         gender,
//       ];
// }

import 'package:equatable/equatable.dart';

class Cast extends Equatable {
  final int id;
  final int tmdbId;
  final String actorName;
  final String characterName;
  final String profilePath;
  final int castId;
  final int gender;
  final String knownForDepartment;
  final double popularity;
  final int order;
  final String profilePictureUrl;

  const Cast({
    required this.id,
    required this.tmdbId,
    required this.actorName,
    required this.characterName,
    required this.profilePath,
    required this.castId,
    required this.gender,
    required this.knownForDepartment,
    required this.popularity,
    required this.order,
    required this.profilePictureUrl,
  });

  @override
  List<Object?> get props => [
        id,
        tmdbId,
        actorName,
        characterName,
        profilePath,
        castId,
        gender,
        knownForDepartment,
        popularity,
        order,
        profilePictureUrl,
      ];
}