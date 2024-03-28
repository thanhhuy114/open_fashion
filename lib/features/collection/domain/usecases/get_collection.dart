import '../../../../ultis/resources/data_state.dart';
import '../../../../ultis/usecase/usecase.dart';
import '../entities/collection_entity.dart';
import '../repositories/collection_repository.dart';

class GetCollectionUsecase implements UseCase<DataState, void> {
  final CollectionRepository _collectionRepository;

  GetCollectionUsecase(this._collectionRepository);

  @override
  Future<DataState<List<CollectionEntity>>> call({void params}) {
    return _collectionRepository.getCollection();
  }
}
