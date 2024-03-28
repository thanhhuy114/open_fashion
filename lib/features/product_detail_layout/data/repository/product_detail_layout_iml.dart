import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../ultis/resources/data_state.dart';
import '../../domain/repository/product_detail_layout_repository.dart';
import '../data_source/remote/product_detail_lauyout_api_service.dart';
import '../models/product_detail_layout_response_models.dart';

class ProductDetailLayoutRepositoryIml
    implements ProductDetailLayoutRepository {
  ProductDetailLayoutRepositoryIml(this._productDetailLayoutApiService);
  final ProductDetailLayoutApiService _productDetailLayoutApiService;
  @override
  Future<DataState<ProductDetailLayoutResponseModel>>
      getProductDetailLayout() async {
    try {
      final httpResponse =
          await _productDetailLayoutApiService.getProductDetailLayout();
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
      log(e.toString());
      return DataFailed(error: e);
    }
  }
}
