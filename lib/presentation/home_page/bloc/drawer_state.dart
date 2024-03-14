part of 'drawer_bloc.dart';

sealed class DrawerState extends Equatable {
  const DrawerState();

  @override
  List<Object> get props => [];
}

final class DrawerLoading extends DrawerState {}

class DrawerLoaded extends DrawerState {
  const DrawerLoaded({this.drawerData = const <DrawerModel>[]});
  final List<DrawerModel> drawerData;
}

class DrawerError extends DrawerState {
  const DrawerError({required this.error});
  final String? error;
}
