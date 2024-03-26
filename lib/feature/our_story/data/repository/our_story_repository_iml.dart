import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../../../ultis/resources/data_state.dart';
import '../../domain/repository/our_story_repository.dart';
import '../data_sources/remote/our_story_api_service.dart';
import '../models/our_story_response_model.dart';

class OurStoryRepositoryIml implements OurStoryRepository {
  OurStoryRepositoryIml(this._ourStoryService);

  final OurStoryApiService _ourStoryService;
  @override
  Future<DataState<OurStoryResponseModel>> getOurStory() async {
    try {
      final httpResponse = await _ourStoryService.getOurStory();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        log(httpResponse.data.data.toString());
        return DataSuccess(data: httpResponse.data);
      } else {
        return DataFailed(
          error: DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(error: e);
    }
  }
}
