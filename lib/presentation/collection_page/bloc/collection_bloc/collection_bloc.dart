import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_fashion/models/collections_response_model.dart';
import 'package:open_fashion/network/api.dart';

part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  CollectionBloc() : super(const CollectionState()) {
    on<LoadCollectionEvent>(_onLoadCollection);
  }

  _onLoadCollection(
      LoadCollectionEvent event, Emitter<CollectionState> emit) async {
    if (state.hasReachedMax) return;
    if (state.status == CollectionStatus.initial) {
      final collection = await Api.getCollections();
      if (collection != null) {
        emit(state.copyWith(
            collections: collection.data!,
            hasReachedMax: false,
            status: CollectionStatus.success));
      } else {
        emit(state.copyWith(status: CollectionStatus.failure));
      }
    }
  }
}
