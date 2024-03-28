import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../ultis/resources/data_state.dart';
import '../../domain/repository/complete_checkout_repository.dart';
import '../data_sources/remote/complete_checkout_api_service.dart';
import '../models/checkout_response_model.dart';

class CompleteCheckoutRepositortIml implements CompleteCheckoutRepository {
  final CompleteCheckoutApiService _completeCheckoutApiService;
  CompleteCheckoutRepositortIml(this._completeCheckoutApiService);
  @override
  Future<DataState<CompleteCheckoutResponeModel>> getCompleteCheckout() async {
    try {
      final httpResponse =
          await _completeCheckoutApiService.getCompleteCheckout();
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
