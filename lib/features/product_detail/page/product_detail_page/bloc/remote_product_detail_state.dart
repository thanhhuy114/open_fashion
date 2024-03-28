part of 'remote_product_detail_bloc.dart';

sealed class RemoteProductDetailState extends Equatable {
  const RemoteProductDetailState({this.productDetail, this.error});
  final ProductDetailEntity? productDetail;
  final DioException? error;
  @override
  List<Object> get props => [productDetail!];
}

final class RemoteProductDetailLoading extends RemoteProductDetailState {
  const RemoteProductDetailLoading();
}

final class RemoteProductDetailDone extends RemoteProductDetailState {
  const RemoteProductDetailDone(final ProductDetailEntity productDetail)
      : super(productDetail: productDetail);
}

final class RemoteProductDetailError extends RemoteProductDetailState {}
