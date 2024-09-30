import 'package:dio/dio.dart';
import 'package:movies_app/core/data/error/exceptions.dart';
import 'package:movies_app/core/data/network/api_constants.dart';
import 'package:movies_app/core/data/network/error_message_model.dart';
import 'package:movies_app/search/data/models/search_result_item_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchResultItemModel>> search(String title);
}

// class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
//   @override
//   Future<List<SearchResultItemModel>> search(String title) async {
//     final response = await Dio().get(ApiConstants.getSearchPath(title));
//     if (response.statusCode == 200) {
//       return List<SearchResultItemModel>.from((response.data['results'] as List)
//           .where((e) => e['media_type'] != 'person')
//           .map((e) => SearchResultItemModel.fromJson(e)));
//     } else {
//       throw ServerException(
//         errorMessageModel: ErrorMessageModel.fromJson(response.data),
//         message: '',
//       );
//     }
//   }
// }
class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  @override
  Future<List<SearchResultItemModel>> search(String title) async {
    try {
      final response = await Dio().get(ApiConstants.getSearchPath(title));
      if (response.statusCode == 200) {
        // Ensure the response.data is treated as a List directly
        return List<SearchResultItemModel>.from((response.data as List)
            .where((e) => e['media_type'] != 'person')
            .map((e) => SearchResultItemModel.fromJson(e)));
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
          message: '',
        );
      }
    } catch (e) {
      throw ServerException(
        message: 'Error fetching search results',
        errorMessageModel: ErrorMessageModel(
            statusCode: 200, statusMessage: "statusMessage", success: false),
      );
    }
  }
}