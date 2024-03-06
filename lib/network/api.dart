import 'package:open_fashion/models/collections_response_model.dart';
import 'package:open_fashion/network/api_provider.dart';
import 'package:open_fashion/network/end_points.dart';
import 'package:open_fashion/network/network_helper.dart';

class Api {
  static final ApiProvider http = ApiProvider();

  /* 
    Create by: Thach
    Date: 6/3 09:28
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
    Date: 6/3 09:28
    Content: Call API get Collections
  */
  static Future<CollectionsResponseModel?> getCollections() async {
    try {
      final res = await http.getRequest(EndPoints.collections,
          headers: await getHeaders());
      final CollectionsResponseModel collections =
          CollectionsResponseModel.fromJson(res!);
      handleExceptionCase(collections.code);
      return collections;
    } catch (_) {
      return null;
    }
  }
}
