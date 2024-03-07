import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_fashion/models/product_detail_layout_response_models.dart';
import 'package:open_fashion/network/api.dart';

part 'product_detail_layout_event.dart';
part 'product_detail_layout_state.dart';

class ProductDetailLayoutBloc
    extends Bloc<ProductDetailLayoutEvent, ProductDetailLayoutState> {
  ProductDetailLayoutBloc() : super(ProductDetailLayoutInitial()) {
    on<ProductDetailLayoutEvent>(_onProductDetailLayout);
  }

  FutureOr<void> _onProductDetailLayout(ProductDetailLayoutEvent event,
      Emitter<ProductDetailLayoutState> emit) async {
    try {
      final productDetailLayoutModel = await Api.getProductDetailLayout();
      log(productDetailLayoutModel.data!.runtimeType.toString());
      emit(ProductDetailLayoutLoaded(
          productDetailLayoutModel: productDetailLayoutModel.data!));
    } catch (e) {
      emit(ProductDetailLayoutError());
    }
  }
}
