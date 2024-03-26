import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'dart:convert';
import '../../../../../network/end_points.dart';
import '../../models/cart_response_model.dart';
part 'cart_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class CartApiService {
  factory CartApiService(final Dio dio) = _CartApiService;

  @GET(EndPoints.cart)
  Future<HttpResponse<CartResponseModel>> getCart();
}
