part of 'remote_product_detail_layout_bloc.dart';

sealed class RemoteProductDetailLayoutState extends Equatable {
  const RemoteProductDetailLayoutState({this.productDetailLayout});
  final ProductDetailLayoutEntity? productDetailLayout;
  @override
  List<Object> get props => [productDetailLayout!];
}

class RemoteProductDetailLayoutLoading extends RemoteProductDetailLayoutState {
  const RemoteProductDetailLayoutLoading();
}

class RemoteProductDetailLayoutDone extends RemoteProductDetailLayoutState {
  const RemoteProductDetailLayoutDone(
    final ProductDetailLayoutEntity productDetailLayout,
  ) : super(productDetailLayout: productDetailLayout);
}

class RemoteProductDetailLayoutError extends RemoteProductDetailLayoutState {
  const RemoteProductDetailLayoutError();
}
