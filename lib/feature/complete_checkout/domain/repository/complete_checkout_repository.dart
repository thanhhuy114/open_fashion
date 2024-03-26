import '../../../../ultis/resources/data_state.dart';
import '../../data/models/checkout_response_model.dart';

abstract class CompleteCheckoutRepository {
  Future<DataState<CompleteCheckoutResponeModel>> getCompleteCheckout();
}
