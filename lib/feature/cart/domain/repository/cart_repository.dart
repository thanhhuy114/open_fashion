import '../../../../ultis/resources/data_state.dart';
import '../../data/models/cart_response_model.dart';

abstract class CartRepository {
  Future<DataState<CartResponseModel>> getCart();
}
