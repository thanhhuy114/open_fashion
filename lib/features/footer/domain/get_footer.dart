import '../../../core/resources/data_state.dart';
import '../../../core/usecases/usecase.dart';
import 'footer.dart';
import 'footer_repository.dart';

class GetFooterUseCase extends UseCase<DataState<FooterEntity>,void>{
  GetFooterUseCase(this._footerRepository);
  final FooterRepository _footerRepository;

  @override
  Future<DataState<FooterEntity>> call({void params}){
    return _footerRepository.getFooter();
  }
}