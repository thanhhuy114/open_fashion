import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/arrival.dart';
import '../repository/arrival_repository.dart';

class GetFollowUsUseCase implements UseCase<DataState<List<FollowUsEntity>>, void>{

  GetFollowUsUseCase(this._arrivalRepository);
  final ArrivalRepository _arrivalRepository;
  @override
  Future<DataState<List<FollowUsEntity>>> call({final void params}){
    return _arrivalRepository.getFollow();
  }
}