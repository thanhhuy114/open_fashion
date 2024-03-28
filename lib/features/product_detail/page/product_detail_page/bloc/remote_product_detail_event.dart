part of 'remote_product_detail_bloc.dart';

sealed class RemoteProductDetailEvent extends Equatable {
  const RemoteProductDetailEvent();

  @override
  List<Object> get props => [];
}

class GetProductDetailEvent extends RemoteProductDetailEvent {
  const GetProductDetailEvent();
}
