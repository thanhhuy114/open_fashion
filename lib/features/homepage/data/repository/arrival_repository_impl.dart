import 'package:dio/dio.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../network/api.dart';
import '../../domain/repository/arrival_repository.dart';
import '../models/menu_arrival_response_model.dart';

class ArrivalRepositoryImpl implements ArrivalRepository{
  ArrivalRepositoryImpl(this._api);
  final Api _api;

  @override
  Future<DataState<List<ArrivalModel>>> getArrival() async{
    try{
      final res = await _api.getMenuArrival();
      return DataSuccess(res!.data!.arrival);
    } on DioError catch(e){
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<JustForYouModel>>> getJustforyou() async{
    try{
      final res = await _api.getMenuArrival();
      return DataSuccess(res!.data!.justforyou);
    } on DioError catch(e){
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<FollowUsModel>>> getFollow() async{
    try{
      final res = await _api.getMenuArrival();
      return DataSuccess(res!.data!.followus);
    } on DioError catch(e){
      return DataFailed(e);
    }
  }
}