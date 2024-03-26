import '../../../../ultis/resources/data_state.dart';
import '../../data/models/product_detail_response_models.dart';

abstract class ProductDetailRepository {
  Future<DataState<ProductDetailResponseModel>> getProductDetail();
}
