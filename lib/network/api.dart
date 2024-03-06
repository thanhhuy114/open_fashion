import 'dart:developer';
import 'package:open_fashion/models/product_detail_layout_response_models.dart';
import 'package:open_fashion/models/product_detail_response_models.dart';
import 'package:open_fashion/network/api_provider.dart';
import 'package:open_fashion/network/end_points.dart';

class Api {
  static final ApiProvider http = ApiProvider();

  static Future<Map<String, dynamic>> getHeaders({
    final bool useConfigToken = false,
  }) async {
    const version = '1.0.0';
    const tokenApi =
        '678b86d66b46eccc9357d611a7bdfd5c56e247b1fa3b4306b254e475848a0207';
    return {
      'version': version,
      'token': tokenApi,
    };
  }

  /* 
    Create by: VieHao
    Date: 
    Content: 
  */
  static Future<ProductDetailResponseModel> getProductDetail() async {
    try {
      final response = await http.getRequest(EndPoints.productDetail);
      final result = ProductDetailResponseModel.fromJson(response!);
      return result;
    } catch (e) {
      log('load faild');
      throw e.toString();
    }
  }

  /* 
    Create by: VieHao
    Date: 
    Content: 
  */
  static Future<ProductDetailLayoutResponseModel>
      getProductDetailLayout() async {
    try {
      final response = await http.getRequest(EndPoints.productDetailLayout);
      final result = ProductDetailLayoutResponseModel.fromJson(response!);
      return result;
    } catch (e) {
      log('load faild');
      throw e.toString();
    }
  }
}
