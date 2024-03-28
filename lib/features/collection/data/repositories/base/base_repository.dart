import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../ultis/resources/data_state.dart';

abstract class BaseRepository<T> {
  @protected
  Future<DataState<T>> getOfState(
      final Future<HttpResponse<T>> Function() request) async {
    try {
      final result = await request();
      if (result.response.statusCode == HttpStatus.ok) {
        return DataSuccess(data: result.data as T);
      } else {
        throw DioException(
          response: result.response,
          requestOptions: RequestOptions(),
        );
      }
    } on DioException catch (e) {
      return DataFailed(error: e);
    }
  }
}
