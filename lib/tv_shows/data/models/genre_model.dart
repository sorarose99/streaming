class GenreModel {
  final int id;
  final String name;

  GenreModel({
    required this.id,
    required this.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class PivotModel {
  final int tmdbId;
  final int genreId;

  PivotModel({
    required this.tmdbId,
    required this.genreId,
  });

  factory PivotModel.fromJson(Map<String, dynamic> json) {
    return PivotModel(
      tmdbId: json['tmdb_id'],
      genreId: json['genre_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tmdb_id': tmdbId,
      'genre_id': genreId,
    };
  }
}
