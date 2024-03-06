import '../models/footer_response_model.dart';
import '../models/menu_arrival_response_model.dart';
import 'api_provider.dart';
import 'end_points.dart';
import 'network_helper.dart';

class Api {
  /* Api._internal();
  static Api instance = Api._internal(); */

  static final ApiProvider http = ApiProvider();

  /* static Future<Map<String, dynamic>> getHeaders(
      {final bool useConfigToken = false,}) async {
    const version = '1.0.0';
    const tokenApi =
        '678b86d66b46eccc9357d611a7bdfd5c56e247b1fa3b4306b254e475848a0207';
    return {
      'version': version,
      'token': tokenApi,
    };
  } */
  /*
    Create by: Thuan
    Date: 5/3
    Content: Lấy Dữ liệu cho HomePageScreen
  */
  Future<MenuArrivalResponseModel?> getMenuArrival()async{
    try{
      final res = await http.getRequest(EndPoints.menuArrival);
      final result = MenuArrivalResponseModel.fromJson(res!);
      handleExceptionCase(result.code);
      return result;
    }catch(e){
      return null;
    }
  }

  Future<FooterResponseModel?> getFooter() async{
    try{
      final res = await http.getRequest(EndPoints.footer);
      final result = FooterResponseModel.fromJson(res!);
      handleExceptionCase(result.code);
      return result;
    }catch(e){
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
}
