part of 'collection_detail_bloc.dart';

abstract class CollectionDetailEvent extends Equatable {
  const CollectionDetailEvent();
}

class LoadCollectionDetailEvent extends CollectionDetailEvent {
  const LoadCollectionDetailEvent({this.collection});
  final CollectionDetailModel? collection;

  @override
  List<Object?> get props {
    throw UnimplementedError();
  }
}
