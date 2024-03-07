import 'package:open_fashion/model/category.dart';
import 'package:open_fashion/model/category_data.dart';
import 'api_provider.dart';
import 'end_points.dart';

class Api {
  static final ApiProvider http = ApiProvider();
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
}
