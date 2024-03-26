import '../../../../core/usecases/usecase.dart';
import '../../../../ultis/resources/data_state.dart';
import '../../data/models/product_detail_layout_response_models.dart';
import '../repository/product_detail_layout_repository.dart';

class GetProductDetailLayoutUsecase
    implements UseCase<DataState<ProductDetailLayoutResponseModel>, void> {
  GetProductDetailLayoutUsecase(this._productDetailLayoutRepository);
  final ProductDetailLayoutRepository _productDetailLayoutRepository;
  @override
  Future<DataState<ProductDetailLayoutResponseModel>> call({
    final void params,
  }) {
    return _productDetailLayoutRepository.getProductDetailLayout();
  }
}
