import 'dart:io';

import 'package:dio/dio.dart';

import '../../domain/repositories/collection_repository.dart';
import '../../../../ultis/resources/data_state.dart';
import '../datasources/remote/collection_api_service.dart';
import '../models/collection.dart';

class CollecctionRepositoryImpl implements CollectionRepository {
  CollectionApiService _apiService;
  CollecctionRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<Collection>>> getCollection() async {
    try {
      final httpResponse = await _apiService.getCollection();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(data: httpResponse.data.collections);
      } else {
        throw DioException(
            requestOptions: RequestOptions(), response: httpResponse.response);
      }
    } on DioException catch (e) {
      return DataFailed(error: e);
    }
  }
}
