import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/footer_response_model.dart';
import '../../../network/api.dart';

part 'footer_event.dart';
part 'footer_state.dart';

class FooterBloc extends Bloc<FooterEvent, FooterState> {
  FooterBloc() : super(FooterLoading()) {
    on<FooterEvent>((final event, final emit) async {
    final Api api =Api();
      emit(FooterLoading());
      try{
        final data = await api.getFooter();
        emit(FooterLoaded(footer: data!.data));
      }catch(e){
        emit(FooterError(error: e.toString()));
      }
    });
  }
}
