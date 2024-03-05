import 'package:open_fashion/models/blog_post.dart';
import 'package:open_fashion/network/api_provider.dart';
import 'package:open_fashion/network/end_points.dart';
import 'package:open_fashion/network/network_helper.dart';

class Api {
  static final ApiProvider http = ApiProvider();

  /* 
    Create by: Thach
    Date: 5/3 13:20
  */
  static Future<Map<String, dynamic>> getHeaders(
      {bool useConfigToken = false}) async {
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
      final res = await http.getRequest(EndPoints.blogPost,
          headers: await getHeaders());
      final BLogPostResponseModel blogPost =
          BLogPostResponseModel.fromJson(res!);
      handleExceptionCase(blogPost.code);
      return blogPost;
    } catch (_) {
      return null;
    }
  }
}
