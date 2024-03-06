part of 'product_detail_layout_bloc.dart';

sealed class ProductDetailLayoutEvent extends Equatable {
  const ProductDetailLayoutEvent();

  @override
  List<Object> get props => [];
}

class ProductDetailLayoutLoadedEvent extends ProductDetailLayoutEvent {}
