import '../models/blog_post.dart';
import 'api_provider.dart';
import 'end_points.dart';
import 'network_helper.dart';
import 'dart:developer';
import '../models/post_menu_response_model.dart';
import '../models/footer_response_model.dart';
import '../models/menu_arrival_response_model.dart';
import '../models/product_detail_layout_response_models.dart';
import '../models/product_detail_response_models.dart';

class Api {
  /* Api._internal();
  static Api instance = Api._internal(); */

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
    Create by: Thach
    Date: 5/3 13:20
    Content: Lấy dữ liệu trang bài viết.
  */
  static Future<BLogPostResponseModel?> getBlogPost() async {
    try {
      final res = await http.getRequest(
        EndPoints.blogPost,
        headers: await getHeaders(),
      );
      final BLogPostResponseModel blogPost =
          BLogPostResponseModel.fromJson(res!);
      handleExceptionCase(blogPost.code);
      return blogPost;
    } catch (_) {
      return null;
    }
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
    Create by: Huy Thanh
    Date: 6/3 16:40
    Content: 
  */
  static Future<PostMenuResponseModel?> fetchPostMenu() async {
    try {
      final res = await http.getRequest(
        EndPoints.postMenu,
        headers: await getHeaders(),
      );
      final result = PostMenuResponseModel.fromJson(res!);
      handleExceptionCase(result.code);
      return result;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  /*
    Create by: Thuan
    Date: 5/3
    Content: Lấy Dữ liệu cho HomePageScreen
  */
  Future<MenuArrivalResponseModel?> getMenuArrival() async {
    try {
      final res = await http.getRequest(EndPoints.menuArrival);
      final result = MenuArrivalResponseModel.fromJson(res!);
      handleExceptionCase(result.code);
      return result;
    } catch (e) {
      return null;
    }
  }

  Future<FooterResponseModel?> getFooter() async {
    try {
      final res = await http.getRequest(EndPoints.footer);
      final result = FooterResponseModel.fromJson(res!);
      handleExceptionCase(result.code);
      return result;
    } catch (e) {
      return null;
    }
  }

  // static Future<LoginModel?> login({
  //   required String email,
  //   required String password,
  //   required String unixTime,
  //   required String token,
  // }) async {
  //   try {
  //     final res = await http.postRequest(
  //       EndPoints.login,
  //       headers: await getHeaders(),
  //       body: {
  //         'email': email,
  //         'pass': password,
  //         'unix_time': unixTime,
  //         'token': token,
  //       },
  //     );
  //     final result = LoginModel.fromJson(res!);
  //     handleExceptionCase(result.status);
  //     return result;
  //   } catch (e) {
  //     return null;
  //   }
  // }
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
