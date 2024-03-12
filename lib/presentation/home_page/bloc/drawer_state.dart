part of 'drawer_bloc.dart';

sealed class DrawerState extends Equatable {
  const DrawerState();
  
  @override
  List<Object> get props => [];
}

final class DrawerLoading extends DrawerState {}
class DrawerLoaded extends DrawerState{
  DrawerLoaded({this.drawerData=const<DrawerModel>[]});
  final List<DrawerModel> drawerData;
}
class DrawerError extends DrawerState{
  final String? error;
  DrawerError({required this.error});
}