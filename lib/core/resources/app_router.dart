import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/presentation/components/error_screen.dart';
import 'package:movies_app/core/presentation/pages/liveScreen.dart';
import 'package:movies_app/core/presentation/pages/main_page.dart';
import 'package:movies_app/movies/presentation/views/movie_details_view.dart';
import 'package:movies_app/movies/presentation/views/movies_view.dart';
import 'package:movies_app/movies/presentation/views/popular_movies_view.dart';
import 'package:movies_app/movies/presentation/views/top_rated_movies_view.dart';
import 'package:movies_app/search/presentation/views/search_view.dart';
import 'package:movies_app/sport/presentation/view/live_screen_view.dart';
import 'package:movies_app/sport/presentation/view/sport_view.dart';
import 'package:movies_app/tv_shows/presentation/views/popular_tv_shows_view.dart';
import 'package:movies_app/tv_shows/presentation/views/top_rated_tv_shows_view.dart';
import 'package:movies_app/tv_shows/presentation/views/tv_show_details_view.dart';
import 'package:movies_app/tv_shows/presentation/views/tv_shows_view.dart';

import 'package:movies_app/core/resources/app_routes.dart';
import 'package:movies_app/watchlist/presentation/views/watchlist_view.dart';

const String moviesPath = '/movies';
const String movieDetailsPath = 'movieDetails/:movieId';
const String popularMoviesPath = 'popularMovies';
const String topRatedMoviesPath = 'topRatedMovies';
const String tvShowsPath = '/tvShows';
const String tvShowDetailsPath = 'tvShowDetails/:tvShowId';
const String popularTVShowsPath = 'popularTVShows';
const String topRatedTVShowsPath = 'topRatedTVShows';
const String searchPath = '/search';
const String watchlistPath = '/watchlist';
const String livePath = '/live';

const String sportPath = '/sport';
const String sportPlayPath = '/sport/:matchId'; 

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: moviesPath,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainPage(child: child),
        routes: [

         
          // New live stream route
       GoRoute(
            name: 'sportPlay',
            path: sportPlayPath,
            builder: (context, state) {
              final matchId = state.pathParameters['matchId']!;
              return SportLiveScreen(liveStreamUrl: matchId,);  // Pass matchId to SportLiveScreen
            },
          ),
         
          GoRoute(
              name: AppRoutes.liveRoute,
              path: livePath,
              builder: (context, state) =>Container()),
             GoRoute(
  name: AppRoutes.sportRoute,
  path: sportPath,
  builder: (context, state) {
    final matchId = state.pathParameters['matchId'];
    if (matchId == null) {
      return ErrorScreen(
        onTryAgainPressed: () {
          // Handle the retry, for example, navigate back or show a default message
          Navigator.of(context).pop(); // Go back if match ID is missing
        },
        // Optionally pass a message or handle custom error display logic
      );
    }
    return SportsView();
  },
),
          GoRoute(
            name: AppRoutes.moviesRoute,
            path: moviesPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: MoviesView(),
            ),
            routes: [
              GoRoute(
                name: AppRoutes.movieDetailsRoute,
                path: movieDetailsPath,
                pageBuilder: (context, state) => CupertinoPage(
                  child: MovieDetailsView(
                    movieId: int.parse(state.pathParameters['movieId']!),
                  ),
                ),
              ),
              GoRoute(
                name: AppRoutes.popularMoviesRoute,
                path: popularMoviesPath,
                pageBuilder: (context, state) => const CupertinoPage(
                  child: PopularMoviesView(),
                ),
              ),
              GoRoute(
                name: AppRoutes.topRatedMoviesRoute,
                path: topRatedMoviesPath,
                pageBuilder: (context, state) => const CupertinoPage(
                  child: TopRatedMoviesView(),
                ),
              ),
            ],
          ),
          GoRoute(
            name: AppRoutes.tvShowsRoute,
            path: tvShowsPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: TVShowsView(),
            ),
            routes: [
              GoRoute(
                name: AppRoutes.tvShowDetailsRoute,
                path: tvShowDetailsPath,
                pageBuilder: (context, state) => CupertinoPage(
                  child: TVShowDetailsView(
                    tvShowId: int.parse(state.pathParameters['tvShowId']!),
                  ),
                ),
              ),
              GoRoute(
                name: AppRoutes.popularTvShowsRoute,
                path: popularTVShowsPath,
                pageBuilder: (context, state) => const CupertinoPage(
                  child: PopularTVShowsView(),
                ),
              ),
              GoRoute(
                name: AppRoutes.topRatedTvShowsRoute,
                path: topRatedTVShowsPath,
                pageBuilder: (context, state) => const CupertinoPage(
                  child: TopRatedTVShowsView(),
                ),
              ),
            ],
          ),
          GoRoute(
            name: AppRoutes.searchRoute,
            path: searchPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SearchView(),
            ),
          ),
          GoRoute(
            name: AppRoutes.watchlistRoute,
            path: watchlistPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: WatchlistView(),
            ),
          ),
        ],
      )
    ],
  );
}
