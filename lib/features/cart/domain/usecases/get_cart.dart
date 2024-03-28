import '../../../../ultis/resources/data_state.dart';
import '../../../../ultis/usecase/usecase.dart';
import '../../data/models/cart_response_model.dart';
import '../repository/cart_repository.dart';

class GetCartUsecase implements UseCase<DataState<CartResponseModel>, void> {
  GetCartUsecase(this._cartRepository);
  final CartRepository _cartRepository;
  @override
  Future<DataState<CartResponseModel>> call({final void params}) {
    return _cartRepository.getCart();
  }
}
