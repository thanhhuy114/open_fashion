part of 'collection_bloc.dart';

enum CollectionStatus { initial, success, failure }

class CollectionState extends Equatable {
  const CollectionState(
      {this.status = CollectionStatus.initial,
      this.collections = const <CollectionDetailModel>[],
      this.hasReachedMax = false});
  final CollectionStatus status;
  final List<CollectionDetailModel> collections;
  final bool hasReachedMax;

  CollectionState copyWith(
      {CollectionStatus? status,
      List<CollectionDetailModel>? collections,
      bool? hasReachedMax}) {
    return CollectionState(
      status: status ?? this.status,
      collections: collections ?? this.collections,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> props() => [collections, status, hasReachedMax];
}
