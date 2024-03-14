import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../models/collections_response_model.dart';
import '../../../../network/api.dart';
part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  CollectionBloc() : super(const CollectionState()) {
    on<LoadCollectionEvent>(_onLoadCollection);
  }

  Future<void> _onLoadCollection(
    final LoadCollectionEvent event,
    final Emitter<CollectionState> emit,
  ) async {
    if (state.hasReachedMax) {
      return;
    }
    if (state.status == CollectionStatus.initial) {
      final collection = await Api.getCollections();
      if (collection != null) {
        emit(
          state.copyWith(
            collections: collection.data,
            hasReachedMax: false,
            status: CollectionStatus.success,
          ),
        );
      } else {
        emit(state.copyWith(status: CollectionStatus.failure));
      }
    }
  }
}
