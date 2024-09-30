import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/domain/entities/media.dart';
import 'package:movies_app/core/domain/entities/media_details.dart';
import 'package:movies_app/core/presentation/components/circle_dot.dart';
import 'package:movies_app/core/presentation/components/slider_card_image.dart';
import 'package:movies_app/core/resources/app_routes.dart';
import 'package:movies_app/core/resources/app_strings.dart';
import 'package:movies_app/core/utils/functions.dart';

import 'package:movies_app/core/resources/app_colors.dart';
import 'package:movies_app/core/resources/app_constants.dart';
import 'package:movies_app/core/resources/app_values.dart';


class SliderCard extends StatelessWidget {
  const SliderCard({
    super.key,
    required this.media,
    required this.itemIndex,
    this.mediaDetails, // Make mediaDetails optional
  });

  final Media media;
  final MediaDetails? mediaDetails; // Nullable
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    final genresString =
        mediaDetails?.genres.map((genre) => genre.name).join(', ') ?? '';

    return GestureDetector(
      onTap: () {
             navigateToDetailsView(context, media);

      },
      child: SafeArea(
        child: Stack(
          children: [
            // Background Image
            SliderCardImage(imageUrl: media.backdropUrl),
            Padding(
              padding: const EdgeInsets.only(
                right: AppPadding.p16,
                left: AppPadding.p16,
                bottom: AppPadding.p10,
              ),
              child: SizedBox(
                height: size.height * 0.55,
                child: Center(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.end, // Center vertically
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Center horizontally
                    children: [
                      // Media Title
                      Text(
                        media.title,
                        maxLines: 2,
                        style: textTheme.titleLarge?.copyWith(
                          color: AppColors.secondaryText,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center, // Center the text
                      ),
                      const SizedBox(height: 4),

                      // Genre, Release Date, and Runtime Display (if mediaDetails is provided)
                      if (mediaDetails != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (media.releaseDate.isNotEmpty) ...[
                              Text(
                                media.releaseDate
                                    .split('-')[0], // Show only the year
                                style: textTheme.bodyLarge,
                              ),
                              const CircleDot(), // Circular separator
                            ],
                            if (genresString.isNotEmpty) ...[
                              Text(
                                genresString,
                                style: textTheme.bodyLarge,
                              ),
                              const CircleDot(), // Circular separator
                            ],
                          ],
                        ),
                      const SizedBox(height: 8),

                      // Row for Buttons ("Watch Now", "My List")
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                                navigateToDetailsView(context, media);

                            },
                            icon: const Icon(Icons.play_arrow,
                                color: AppColors.secondaryText),
                            label: const Text(
                              AppStrings.watchNow,
                              style: TextStyle(color: AppColors.secondaryText),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              textStyle: const TextStyle(
                                color: AppColors.secondaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          OutlinedButton.icon(
                            onPressed: () {
                              // Navigate to Watchlist
                              context.goNamed(AppRoutes.watchlistRoute);
                            },
                            icon: const Icon(Icons.add,
                                color: AppColors.primaryText),
                            label: const Text(
                              AppStrings.myList,
                              style: TextStyle(color: AppColors.secondaryText),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: AppColors.primaryText),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryText,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Dots Indicator for slider position
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center the dots
                        children: List.generate(
                          AppConstants.carouselSliderItemsCount,
                          (indexDot) {
                            return Container(
                              margin:
                                  const EdgeInsets.only(right: AppMargin.m10),
                              width: indexDot == itemIndex
                                  ? AppSize.s30
                                  : AppSize.s6,
                              height: AppSize.s6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppSize.s6),
                                color: indexDot == itemIndex
                                    ? AppColors.primary
                                    : AppColors.inactiveColor,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

