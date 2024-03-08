part of 'product_detail_bloc.dart';

sealed class ProductDetailState extends Equatable {
  const ProductDetailState();
  @override
  List<Object> get props => [];
}

final class ProductDetailInitial extends ProductDetailState {}

final class ProductDetailLoading extends ProductDetailState {
  const ProductDetailLoading();
}

final class ProductDetailLoaded extends ProductDetailState {
  const ProductDetailLoaded({this.productDetailModel});
  final ProductDetailModel? productDetailModel;
  @override
  List<Object> get props => [productDetailModel!];
}

final class ProductDetailError extends ProductDetailState {
  const ProductDetailError({this.errorMessage});
  final String? errorMessage;
  @override
  List<Object> get props => [errorMessage!];
}
