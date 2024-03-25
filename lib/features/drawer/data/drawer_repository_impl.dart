import 'package:dio/dio.dart';

import '../../../core/resources/data_state.dart';
import '../../../network/api.dart';
import '../domain/drawer.dart';
import '../domain/drawer_repository.dart';

class DrawerRepositoryImpl implements DrawerRepository{
  DrawerRepositoryImpl(this._api);
  final Api _api;

  @override
  Future<DataState<List<DrawerEntity>>> getDrawer() async{
    try{
    final res = await _api.getDrawer();
    return DataSuccess(res!.data!.drawer);
    } on DioError catch (e){
      return DataFailed(e);
    }
  }
}