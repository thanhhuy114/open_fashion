part of 'collection_detail_bloc.dart';

abstract class CollectionDetailEvent extends Equatable {
  const CollectionDetailEvent();
}

class LoadCollectionDetailEvent extends CollectionDetailEvent {
  final CollectionDetailModel? collection;

  LoadCollectionDetailEvent({this.collection});

  @override
  List<Object?> props() {
    throw UnimplementedError();
  }
}
