part of 'remote_collection_bloc.dart';

abstract class RemoteCollectionState extends Equatable {
  const RemoteCollectionState({this.collecttion = const [], this.error});
  final List<Collection> collecttion;
  final DioException? error;

  @override
  List<Object> get props => [collecttion];
}

class RemoteCollectionLoading extends RemoteCollectionState {
  const RemoteCollectionLoading();
}

class RemoteCollectionSuccess extends RemoteCollectionState {
  const RemoteCollectionSuccess({super.collecttion});
}

class RemoteCollectionFailed extends RemoteCollectionState {
  const RemoteCollectionFailed({super.error});
}
