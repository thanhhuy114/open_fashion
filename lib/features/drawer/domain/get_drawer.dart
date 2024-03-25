
import '../../../core/resources/data_state.dart';
import '../../../core/usecases/usecase.dart';
import 'drawer.dart';
import 'drawer_repository.dart';

class GetDrawerUseCase extends UseCase<DataState<List<DrawerEntity>>,void>{
  GetDrawerUseCase(this._drawerRepository);
  final DrawerRepository _drawerRepository;

  @override
  Future<DataState<List<DrawerEntity>>> call({final void params}){
    return _drawerRepository.getDrawer();
  }
}