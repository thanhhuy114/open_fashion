import '../../../../ultis/resources/data_state.dart';
import '../../../../ultis/usecase/usecase.dart';
import '../../data/models/product_detail_response_models.dart';
import '../repository/product_detail_repository.dart';

class GetProductDetailUseCase
    implements UseCase<DataState<ProductDetailResponseModel>, void> {
  GetProductDetailUseCase(this._productDetailRepository);
  final ProductDetailRepository _productDetailRepository;
  @override
  Future<DataState<ProductDetailResponseModel>> call({final void params}) {
    return _productDetailRepository.getProductDetail();
  }
}
