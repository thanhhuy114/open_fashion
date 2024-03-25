import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/contact_us.dart';
import '../../domain/get_contact_us.dart';

part 'contact_us_event.dart';
part 'contact_us_state.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  /* ContactUsBloc() : super(ContactUsLoading()) {
    on<ContactUsEvent>((final event, final emit) async {
      emit(ContactUsLoading());
      final Api api = Api();
      try {
        final data = await api.getContactUs();
        emit(ContactUsLoaded(contactus: data!.data));
      } catch (e) {
        emit(ContactUsError(error: e.toString()));
      }
    });
  } */
  final GetContactUsUseCase _getContactUsUseCase;
  ContactUsBloc(this._getContactUsUseCase):super(ContactUsLoading()){
    on<GetContact> (onGetContactUs);
  }

  void onGetContactUs(GetContact event, Emitter<ContactUsState> emit) async{
    final dataState = await _getContactUsUseCase();
    if(dataState is DataSuccess && dataState.data!=null){
      emit(ContactUsLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(ContactUsError(dataState.error!));
    }
    
  }
}
