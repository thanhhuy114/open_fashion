import '../../../../ultis/resources/data_state.dart';
import '../../data/models/product_detail_layout_response_models.dart';

abstract class ProductDetailLayoutRepository {
  Future<DataState<ProductDetailLayoutResponseModel>> getProductDetailLayout();
}
