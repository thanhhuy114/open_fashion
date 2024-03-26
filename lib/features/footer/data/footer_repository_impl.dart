import 'package:dio/dio.dart';

import '../../../core/resources/data_state.dart';
import '../../../network/api.dart';
import '../domain/footer.dart';
import '../domain/footer_repository.dart';

class FooterRepositoryImpl implements FooterRepository{
  FooterRepositoryImpl(this._api);
  final Api _api;

  @override
  Future<DataState<FooterEntity>> getFooter() async {
    try{
      final res = await _api.getFooter();
      return DataSuccess(res!.data!);
    } on DioError catch(e){
      return DataFailed(e);
    }
  }
}