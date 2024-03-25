import '../../../../ultis/resources/data_state.dart';
import '../entities/collection_entity.dart';

abstract class CollectionRepository {
  Future<DataState<List<CollectionEntity>>> getCollection();
}
