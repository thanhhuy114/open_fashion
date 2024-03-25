import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/data_state.dart';
import '../../../network/api.dart';
import '../domain/contact_us.dart';
import '../domain/contact_us_repository.dart';

class ContactUsRepositoryImpl implements ContactUsRepository{
  final Api _api;
  ContactUsRepositoryImpl(this._api);

  @override
  Future<DataState<ContactUsEntity>> getContactUs()async{
    try{
      final response = await _api.getContactUs();
      return DataSuccess(response!.data);
    } on DioError catch(e){
      return DataFailed(e);
    }
  }
}