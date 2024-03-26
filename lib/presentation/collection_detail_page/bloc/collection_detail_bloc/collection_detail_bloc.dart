import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../models/collections_response_model.dart';
part 'collection_detail_event.dart';
part 'collection_detail_state.dart';

class CollectionDetailBloc
    extends Bloc<CollectionDetailEvent, CollectionDetailState> {
  CollectionDetailBloc() : super(CollectionDetailLoading()) {
    on<LoadCollectionDetailEvent>(loadCollectionDetail);
  }

  void loadCollectionDetail(
    final LoadCollectionDetailEvent event,
    final Emitter<CollectionDetailState> emit,
  ) {
    if (event.collection == null) {
      emit(CollectionDetailFailure());
    } else {
      emit(CollectionDetailLoaded(colletion: event.collection!));
    }
  }
}
