part of 'remote_product_detail_layout_bloc.dart';

sealed class RemoteProductDetailLayoutEvent extends Equatable {
  const RemoteProductDetailLayoutEvent();

  @override
  List<Object> get props => [];
}

class GetProductDetailLayout extends RemoteProductDetailLayoutEvent {
  const GetProductDetailLayout();
}
