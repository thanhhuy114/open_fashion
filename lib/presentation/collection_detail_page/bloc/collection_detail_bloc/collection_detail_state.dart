part of 'collection_detail_bloc.dart';

abstract class CollectionDetailState extends Equatable {
  const CollectionDetailState();
}

class CollectionDetailLoading extends CollectionDetailState {
  @override
  List<Object?> get props {
    // TODO: implement props
    throw UnimplementedError();
  }
}

class CollectionDetailLoaded extends CollectionDetailState {
  final CollectionDetailModel colletion;

  const CollectionDetailLoaded({required this.colletion});

  @override
  List<Object?> get props {
    // TODO: implement props
    throw UnimplementedError();
  }
}

class CollectionDetailFailure extends CollectionDetailState {
  @override
  List<Object?> get props {
    // TODO: implement props
    throw UnimplementedError();
  }
}
