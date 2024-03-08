import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/contact_us_response_model.dart';
import '../../../network/api.dart';

part 'contact_us_event.dart';
part 'contact_us_state.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  ContactUsBloc() : super(ContactUsLoading()) {
    on<ContactUsEvent>((event, emit) async {
      emit(ContactUsLoading());
      final Api api =Api();
      try{
        final data = await api.getContactUs();
        emit(ContactUsLoaded(contactus: data!.data));
      }catch(e){
        emit(ContactUsError(error: e.toString()));
      }
    });
  }
}
