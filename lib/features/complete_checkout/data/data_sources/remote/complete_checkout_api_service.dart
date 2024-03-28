import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'dart:convert';
import '../../../../../network/end_points.dart';
import '../../models/checkout_response_model.dart';
part 'complete_checkout_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl, parser: Parser.JsonSerializable)
abstract class CompleteCheckoutApiService {
  factory CompleteCheckoutApiService(final Dio dio) =
      _CompleteCheckoutApiService;
  @GET(EndPoints.completeCheckout)
  Future<HttpResponse<CompleteCheckoutResponeModel>> getCompleteCheckout();
}
