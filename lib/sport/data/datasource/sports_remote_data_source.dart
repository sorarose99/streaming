
import 'package:dio/dio.dart';
import 'package:movies_app/core/data/network/error_message_model.dart';
import 'package:movies_app/sport/data/models/sport_model.dart';
import 'package:movies_app/core/data/error/exceptions.dart';

abstract class SportsRemoteDataSource {
  Future<List<SportModel>> getLiveMatches();
}

class SportsRemoteDataSourceImpl extends SportsRemoteDataSource {
  final Dio _dio;
  final String _apiKey;

  SportsRemoteDataSourceImpl(this._dio, this._apiKey);

  @override
  Future<List<SportModel>> getLiveMatches() async {
    try {
      final response = await _dio.get(
        'https://football-live-stream-api.p.rapidapi.com/index.php',
        queryParameters: {'live': 'all'},
        options: Options(
          headers: {
            'X-RapidAPI-Key': _apiKey,
            'X-RapidAPI-Host': 'football-live-stream-api.p.rapidapi.com',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Debug: Print the raw response to analyze the structure
        print('Response data: ${response.data}');
        
        // Handle the data and map it to SportModel
        return (response.data as List)
            .map((match) => SportModel.fromJson(match))
            .toList();
      } else {
        throw ServerException(
          message: 'Failed to load live matches',
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (error) {
      print('Error: $error');
      throw ServerException(message: error.toString(), errorMessageModel: ErrorMessageModel(statusCode: 204, statusMessage: "statusMessage", success: false));
    }
  }
}
