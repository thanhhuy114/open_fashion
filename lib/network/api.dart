// ignore_for_file: only_throw_errors

import '../models/blog_post.dart';
import '../models/collections_response_model.dart';
import '../models/drawer_response_model.dart';
import '../models/checkout_response_model.dart';
import '../models/card_response_model.dart';
import '../models/our_story_response_model.dart';
import 'api_provider.dart';
import 'end_points.dart';
import 'network_helper.dart';
import 'dart:developer';
import '../models/post_menu_response_model.dart';
import '../models/footer_response_model.dart';
import '../models/menu_arrival_response_model.dart';
import '../models/product_detail_layout_response_models.dart';
import '../models/product_detail_response_models.dart';
import '../models/category_data.dart';
import '../models/category.dart';

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

  static Future<CategoryData?> getCategoryDataResponse() async {
    try {
      final data = await http.getRequest(EndPoints.category);
      return CategoryData.fromJson(data!);
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<List<Cat>?> getCategoryResponse() async {
    final data = await getCategoryDataResponse();
    return data!.data;
  }

  /*
    Create by: Thach
    Date: 8/3 11:26
    Content: Lay danh sach card infor
  */
  static Future<CardResponseModel> getCards() async {
    try {
      final response = await http.getRequest(EndPoints.card);
      final card = CardResponseModel.fromJson(response!);
      handleExceptionCase(card.code);
      return card;
    } catch (e) {
      log('load faild');
      throw e.toString();
    }
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
    Create by: Thach
    Date: 6/3 09:28
    Content: Call API get Collections
  */
  static Future<CollectionsResponseModel?> getCollections() async {
    try {
      final res = await http.getRequest(
        EndPoints.collections,
        headers: await getHeaders(),
      );
      final CollectionsResponseModel collections =
          CollectionsResponseModel.fromJson(res!);
      handleExceptionCase(collections.code);
      return collections;
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

  /*
    Create by Thuan
    Data: 07/03
    Content: Lấy data cho Drawer
  */
  Future<DrawerResponseModel?> getDrawer() async {
    try {
      final res = await http.getRequest(EndPoints.drawer);
      final result = DrawerResponseModel.fromJson(res!);
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

  static Future<CompleteCheckoutResponeModel> getCheckout() async {
    try {
      final response = await http.getRequest(EndPoints.completeCheckout);
      final result = CompleteCheckoutResponeModel.fromJson(response!);
      return result;
    } catch (e) {
      log('load faild');
      throw e.toString();
    }
  }

   static Future<OurStoryResponseModel> getOurStory() async {
    try {
      final response = await http.getRequest(EndPoints.ourStory);
      final result = OurStoryResponseModel.fromJson(response!);
      return result;
    } catch (e) {
      log('load faild');
      throw e.toString();
    }
  }
}
