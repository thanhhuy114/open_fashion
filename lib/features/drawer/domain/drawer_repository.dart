import '../../../core/resources/data_state.dart';
import 'drawer.dart';

abstract class DrawerRepository{
  Future<DataState<List<DrawerEntity>>> getDrawer();
}