import 'package:open_fashion/core/usecases/usecase.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/arrival.dart';
import '../repository/arrival_repository.dart';

class GetJustForYouUseCase implements UseCase<DataState<List<JustForYouEntity>>, void>{

  GetJustForYouUseCase(this._arrivalRepository);
  final ArrivalRepository _arrivalRepository;
  @override
  Future<DataState<List<JustForYouEntity>>> call({final void params}){
    return _arrivalRepository.getJustforyou();
  }
}