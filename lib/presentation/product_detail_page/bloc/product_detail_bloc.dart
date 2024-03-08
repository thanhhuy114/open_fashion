import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/product_detail_response_models.dart';
import '../../../network/api.dart';
part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(const ProductDetailLoading()) {
    on<ProductDetailLoadedEvent>(_onProductDetailEvent);
  }

  FutureOr<void> _onProductDetailEvent(
    final ProductDetailLoadedEvent event,
    final Emitter<ProductDetailState> emit,
  ) async {
    emit(const ProductDetailLoading());
    try {
      final productDetailModel = await Api.getProductDetail();
      emit(ProductDetailLoaded(productDetailModel: productDetailModel.data));
    } catch (e) {
      emit(ProductDetailError(errorMessage: e.toString()));
    }
  }
}
