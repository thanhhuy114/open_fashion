import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'dart:convert';
import '../../../../../network/end_points.dart';
import '../../models/product_detail_response_models.dart';
part 'product_detail_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl, parser: Parser.JsonSerializable)
abstract class ProductDetailApiService {
  factory ProductDetailApiService(final Dio dio) = _ProductDetailApiService;

  @GET(EndPoints.productDetail)
  Future<HttpResponse<ProductDetailResponseModel>> getProductDetail();
}
