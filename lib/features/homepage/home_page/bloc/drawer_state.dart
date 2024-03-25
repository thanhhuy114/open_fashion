part of 'drawer_bloc.dart';

sealed class DrawerState extends Equatable {
  const DrawerState({this.drawer,this.error});
  final List<DrawerEntity> ? drawer;
  final DioError ? error;
  @override
  List<Object> get props => [drawer!,error!];
}

class DrawerLoading extends DrawerState {}

class DrawerLoaded extends DrawerState {
  DrawerLoaded(List<DrawerEntity> drawer):super(drawer: drawer);
}

class DrawerError extends DrawerState {
  DrawerError(DioError error):super(error: error);
}
