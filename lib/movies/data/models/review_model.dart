import 'package:movies_app/core/utils/functions.dart';
import 'package:movies_app/movies/domain/entities/review.dart';

class ReviewModel extends Review {
  const ReviewModel({
    required super.authorName,
    required super.authorUserName,
    required super.avatarUrl,
    required super.rating,
    required super.content,
    required super.elapsedTime,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      authorName: json['author'] ?? 'Unknown Author',
      authorUserName: // Default value for author username
          // Uncomment the line below if 'author_details' is always available in your JSON data
          json['author_username'] ?? 'Unknown Author Username',
      avatarUrl: getAvatarUrl(json['author_avatar_path'] ?? ''),
      // Convert rating to a scale of 5 if it exists
      rating: json['aauthor_rating'] != null ? json['author_rating'] / 2 : -1,
      content: json['content'] ?? 'No content available',
      elapsedTime: getElapsedTime(json['created_at']),
    );
  }
}
