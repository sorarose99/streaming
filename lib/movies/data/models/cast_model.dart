// import 'package:movies_app/core/utils/functions.dart';
// import 'package:movies_app/movies/domain/entities/cast.dart';

// class CastModel extends Cast {
//   const CastModel({
//     required String name,
//     required String profileUrl,
//     required int gender,
//   }) : super(
//           name: name,
//           profileUrl: profileUrl,
//           gender: gender,
//         );

//   factory CastModel.fromJson(Map<String, dynamic> json) {
//     return CastModel(
//       name: json['actor_name'] ?? '',
//       profileUrl: getPosterUrl(json['profile_picture_url']),
//       gender: json['gender'] ?? 0,
//     );
//   }
// }
import 'package:movies_app/movies/domain/entities/cast.dart';
import 'package:movies_app/core/utils/functions.dart';

class CastModel extends Cast {
  const CastModel({
    required int id,
    required int tmdbId,
    required String actorName,
    required String characterName,
    required String profilePath,
    required int castId,
    required int gender,
    required String knownForDepartment,
    required double popularity,
    required int order,
    required String profilePictureUrl,
  }) : super(
          id: id,
          tmdbId: tmdbId,
          actorName: actorName,
          characterName: characterName,
          profilePath: profilePath,
          castId: castId,
          gender: gender,
          knownForDepartment: knownForDepartment,
          popularity: popularity,
          order: order,
          profilePictureUrl: profilePictureUrl,
        );

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      id: json['id'] ?? 0,
      tmdbId: json['tmdb_id'] ?? 0,
      actorName: json['actor_name'] ?? '',
      characterName: json['character_name'] ?? '',
      profilePath: json['profile_path'] ?? '',
      castId: json['cast_id'] ?? 0,
      gender: json['gender'] ?? 0,
      knownForDepartment: json['known_for_department'] ?? '',
      popularity: (json['popularity'] ?? 0.0).toDouble(),
      order: json['order'] ?? 0,
      profilePictureUrl: (json['profile_picture_url']) ?? '',
    );
  }
}
