import 'package:movies_app/movies/data/models/cast_model.dart';
import 'package:movies_app/tv_shows/domain/usecases/get_season_details_usecase.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiConstants {
  static const String apiKey = '';
  static const String baseUrl = 'https://labcorn.net';
 

  static const String baseBackdropUrl = 'https://image.tmdb.org/t/p/w1280';
  static const String basePosterUrl = 'https://image.tmdb.org/t/p/w500';
  static const String baseProfileUrl = 'https://image.tmdb.org/t/p/w300';
  static const String baseStillUrl = 'https://image.tmdb.org/t/p/w500';
  static const String baseAvatarUrl = 'https://image.tmdb.org/t/p/w185';
  static const String baseVideoUrl = 'https://www.youtube.com/watch?v=';

  static const String moviePlaceHolder =
      'https://davidkoepp.com/wp-content/themes/blankslate/images/Movie%20Placeholder.jpg';

  static const String castPlaceHolder =
      'https://palmbayprep.org/wp-content/uploads/2015/09/user-icon-placeholder.png';

  static const String avatarPlaceHolder =
      'https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049__480.png';

  static const String stillPlaceHolder =
      'https://popcornsg.s3.amazonaws.com/gallery/1577405144-six-year.png';

  // movies paths
  static const String nowPlayingMoviesPath = '$baseUrl/api/movie/now_playing';

  static const String popularMoviesPath = '$baseUrl/api/movie/popular';

  static const String topRatedMoviesPath = '$baseUrl/api/movie/top_rated';

  static String getMovieDetailsPath(int tmdbID) {
    return '$baseUrl/api/movieDetails/$tmdbID';
  }

  static String getAllPopularMoviesPath(int page) {
    return '$baseUrl/api/movieDetails/popular&page=${100}';
  }

  static String getAllTopRatedMoviesPath(int page) {
    return '$baseUrl/api/movieDetails/top_rated&page=${100}';
  }

  // tv shows paths
  static const String onAirTvShowsPath = '$baseUrl/api/tv/on_the_air';

  static const String popularTvShowsPath = '$baseUrl/api/tv/popular';

  static const String topRatedTvShowsPath = '$baseUrl/api/tv/top_rated';

  static String getTvShowDetailsPath(int tmdbID) {
    return '$baseUrl/api/tv-details/$tmdbID';
  }

  static String getSeasonDetailsPath(SeasonDetailsParams params) {
    return '$baseUrl/api/tv-details/${params.tmdb_id}/season/${params.season_number}';
  }

  static String getAllPopularTvShowsPath(int page) {
    return '$baseUrl/api/tv-details/popular&page=${1000}';
  }

  static String getAllTopRatedTvShowsPath(int page) {
    return '$baseUrl/api/tv/top_rated&page=${1000}';
  }

  // search paths
  static String getSearchPath(String title) {
    return '$baseUrl/api/search/multi?query=$title';
  }
}
