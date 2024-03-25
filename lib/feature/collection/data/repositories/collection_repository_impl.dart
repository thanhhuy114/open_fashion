import '../../domain/repositories/collection_repository.dart';
import '../../../../ultis/resources/data_state.dart';
import '../datasources/remote/collection_api_service.dart';
import 'base/base_repository.dart';

class CollecctionRepositoryImpl extends BaseRepository
    implements CollectionRepository {
  CollectionApiService _apiService;
  CollecctionRepositoryImpl(this._apiService);

  @override
  Future<DataState> getCollection() {
    return getOfState(() => _apiService.getCollection());
  }
}
