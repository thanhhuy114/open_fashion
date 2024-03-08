import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/product_detail_layout_response_models.dart';
import '../../../network/api.dart';
part 'product_detail_layout_event.dart';
part 'product_detail_layout_state.dart';

class ProductDetailLayoutBloc
    extends Bloc<ProductDetailLayoutEvent, ProductDetailLayoutState> {
  ProductDetailLayoutBloc() : super(const ProductDetailLayoutLoading()) {
    on<ProductDetailLayoutEvent>(_onProductDetailLayout);
  }

  FutureOr<void> _onProductDetailLayout(
    final ProductDetailLayoutEvent event,
    final Emitter<ProductDetailLayoutState> emit,
  ) async {
    emit(const ProductDetailLayoutLoading());
    try {
      final productDetailLayoutModel = await Api.getProductDetailLayout();
      emit(
        ProductDetailLayoutLoaded(
          productDetailLayoutModel: productDetailLayoutModel.data,
        ),
      );
    } catch (e) {
      emit(ProductDetailLayoutError(errorMessage: e.toString()));
    }
  }
}
