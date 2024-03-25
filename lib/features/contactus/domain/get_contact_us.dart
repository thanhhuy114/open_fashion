import '../../../core/resources/data_state.dart';
import '../../../core/usecases/usecase.dart';
import 'contact_us.dart';
import 'contact_us_repository.dart';

class GetContactUsUseCase implements UseCase<DataState<ContactUsEntity>,void>{
  final ContactUsRepository _contactUsRepository;
  GetContactUsUseCase(this._contactUsRepository);

  Future<DataState<ContactUsEntity>> call({void params}){
    return _contactUsRepository.getContactUs();
  }
}