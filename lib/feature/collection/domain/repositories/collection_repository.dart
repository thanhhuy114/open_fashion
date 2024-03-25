import '../../../../ultis/resources/data_state.dart';

abstract class CollectionRepository {
  Future<DataState> getCollection();
}
