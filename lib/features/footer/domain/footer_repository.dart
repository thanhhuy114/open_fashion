import '../../../core/resources/data_state.dart';
import 'footer.dart';

abstract class FooterRepository {
  Future<DataState<FooterEntity>> getFooter();
}