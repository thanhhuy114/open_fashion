import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/arrival.dart';
import '../repository/arrival_repository.dart';

class GetArrivalUseCase implements UseCase<DataState<List<ArrivalEntity>>, void>{

  GetArrivalUseCase(this._arrivalRepository);
  final ArrivalRepository _arrivalRepository;
  @override
  Future<DataState<List<ArrivalEntity>>> call({final void params}){
    return _arrivalRepository.getArrival();
  }
}