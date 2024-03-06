import 'dart:developer';

import '../models/post_menu_response_model.dart';
import 'api_provider.dart';
import 'end_points.dart';
import 'network_helper.dart';

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
}
