import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/collection_entity.dart';
import '../../../../domain/usecases/get_collection.dart';
import '../../../../../../ultis/resources/data_state.dart';

part 'remote_collection_event.dart';
part 'remote_collection_state.dart';

class RemoteCollectionBloc
    extends Bloc<RemoteCollectionEvent, RemoteCollectionState> {
  final GetCollectionUsecase _collectionUsecase;
  RemoteCollectionBloc(this._collectionUsecase)
      : super(const RemoteCollectionLoading()) {
    on<LoadCollection>(getAllCollection);
  }

  getAllCollection(LoadCollection event, Emitter emit) async {
    emit(const RemoteCollectionLoading());
    final result = await _collectionUsecase();
    if (result is DataSuccess) {
      emit(RemoteCollectionSuccess(collecttion: result.data!));
    } else if (result is DataFailed) {
      emit(RemoteCollectionFailed(error: result.error));
    }
  }
}
