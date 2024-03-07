import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/drawer_response_model.dart';
import '../../../network/api.dart';

part 'drawer_event.dart';
part 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(DrawerInitial()) {
    on<DrawerEvent>((event, emit) async{
      final Api api = Api();
      emit(DrawerInitial());
      try{
        final data = await api.getDrawer();
        emit(DrawerLoaded(drawerData: data!.data!.drawer));
      }catch(e){
        emit(DrawerError(error: e.toString()));
      }
    });
  }
}
