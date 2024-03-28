import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../ultis/resources/data_state.dart';
import '../../domain/repository/cart_repository.dart';
import '../data_sources/remote/cart_api_service.dart';
import '../models/cart_response_model.dart';

class CartRepositoryIml implements CartRepository {
  CartRepositoryIml(this._cartApiService);
  final CartApiService _cartApiService;
  @override
  Future<DataState<CartResponseModel>> getCart() async {
    try {
      final httpResponse = await _cartApiService.getCart();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
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
