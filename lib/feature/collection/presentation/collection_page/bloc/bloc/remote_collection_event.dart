part of 'remote_collection_bloc.dart';

abstract class RemoteCollectionEvent extends Equatable {
  const RemoteCollectionEvent();

  @override
  List<Object> get props => [];
}

class LoadCollection extends RemoteCollectionEvent {}
