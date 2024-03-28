import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'dart:convert';
import '../../../../../network/end_points.dart';
import '../../models/product_detail_layout_response_models.dart';
part 'product_detail_lauyout_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl, parser: Parser.JsonSerializable)
abstract class ProductDetailLayoutApiService {
  factory ProductDetailLayoutApiService(final Dio dio) = _ProductDetailLayoutApiService;

  @GET(EndPoints.productDetailLayout)
  Future<HttpResponse<ProductDetailLayoutResponseModel>> getProductDetailLayout();
}
