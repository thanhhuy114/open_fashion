part of 'product_detail_layout_bloc.dart';

sealed class ProductDetailLayoutState extends Equatable {
  const ProductDetailLayoutState();

  @override
  List<Object> get props => [];
}

final class ProductDetailLayoutInitial extends ProductDetailLayoutState {}

final class ProductDetailLayoutLoading extends ProductDetailLayoutState {
  const ProductDetailLayoutLoading();
}

final class ProductDetailLayoutLoaded extends ProductDetailLayoutState {
  const ProductDetailLayoutLoaded({required this.productDetailLayoutModel});
  final ProductDetailLayoutModel productDetailLayoutModel;
  @override
  List<Object> get props => [productDetailLayoutModel];
}

final class ProductDetailLayoutError extends ProductDetailLayoutState {
  const ProductDetailLayoutError({this.errorMessage});
  final String? errorMessage;
  @override
  List<Object> get props => [errorMessage!];
}
