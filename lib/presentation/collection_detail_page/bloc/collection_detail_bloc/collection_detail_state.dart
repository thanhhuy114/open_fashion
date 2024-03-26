part of 'collection_detail_bloc.dart';

abstract class CollectionDetailState extends Equatable {
  const CollectionDetailState();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CollectionDetailLoading extends CollectionDetailState {}

class CollectionDetailLoaded extends CollectionDetailState {
  const CollectionDetailLoaded({required this.colletion});
  final CollectionDetailModel colletion;
}

class CollectionDetailFailure extends CollectionDetailState {}
