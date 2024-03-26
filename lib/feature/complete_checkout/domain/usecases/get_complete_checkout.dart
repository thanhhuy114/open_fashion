import '../../../../ultis/resources/data_state.dart';
import '../../../../ultis/usecase/usecase.dart';
import '../../data/models/checkout_response_model.dart';
import '../repository/complete_checkout_repository.dart';

class GetCompleteCheckoutUsecase
    extends UseCase<DataState<CompleteCheckoutResponeModel>, void> {
  GetCompleteCheckoutUsecase(this._completeCheckoutRepository);
  final CompleteCheckoutRepository _completeCheckoutRepository;
  @override
  Future<DataState<CompleteCheckoutResponeModel>> call({final void params}) {
    return _completeCheckoutRepository.getCompleteCheckout();
  }
}
