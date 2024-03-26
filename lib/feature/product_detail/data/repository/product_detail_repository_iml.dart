import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../ultis/resources/data_state.dart';
import '../../domain/repository/product_detail_repository.dart';
import '../data_sources/remote/product_detail_api_service.dart';
import '../models/product_detail_response_models.dart';

class ProductDetailRepositoryIml implements ProductDetailRepository {
  ProductDetailRepositoryIml(this._productDetailApiService);
  final ProductDetailApiService _productDetailApiService;
  @override
  Future<DataState<ProductDetailResponseModel>> getProductDetail() async {
    try {
      final httpResponse = await _productDetailApiService.getProductDetail();
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
