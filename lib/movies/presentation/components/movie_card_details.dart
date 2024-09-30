
import 'package:flutter/material.dart';
import 'package:movies_app/core/domain/entities/media_details.dart';
import 'package:movies_app/core/presentation/components/circle_dot.dart';

class MovieCardDetails extends StatelessWidget {
  const MovieCardDetails({
    super.key,
    required this.movieDetails,
  });

  final MediaDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // Convert the list of genres to a single string
    final genresString = movieDetails.genres.map((genre) => genre.name).join(', ');

    if (movieDetails.releaseDate.isNotEmpty &&
        genresString.isNotEmpty &&
        movieDetails.runtime!.isNotEmpty) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            if (movieDetails.releaseDate.isNotEmpty) ...[
              Text(
                movieDetails.releaseDate.split(',')[1],
                style: textTheme.bodyLarge,
              ),
              const CircleDot(),
            ],
            if (genresString.isNotEmpty) ...[
              Text(
                genresString,
                style: textTheme.bodyLarge,
              ),
              const CircleDot(),
            ] else if (movieDetails.runtime!.isNotEmpty) ...[
              const CircleDot(),
            ],
            Text(
              movieDetails.runtime!,
              style: textTheme.bodyLarge,
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
