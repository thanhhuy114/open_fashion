import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_fashion/models/product_detail_response_models.dart';
import 'package:open_fashion/network/api.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailInitial()) {
    on<ProductDetailLoadedEvent>(_onProductDetailEvent);
  }

  FutureOr<void> _onProductDetailEvent(
      ProductDetailLoadedEvent event, Emitter<ProductDetailState> emit) async {
    try {
      final productDetailModel = await Api.getProductDetail();
      log(productDetailModel.data!.runtimeType.toString());
      emit(ProductDetailLoaded(productDetailModel: productDetailModel.data));
    } catch (e) {
      emit(ProductDetailError());
    }
  }
}
