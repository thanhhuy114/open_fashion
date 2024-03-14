part of 'category_bloc.dart';

@immutable
sealed class CategoryState {
  const CategoryState();

  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  const CategoryLoaded({this.lstCat = const <Cat>[]});
  final List<Cat> lstCat;

  @override
  List<Object> get props => [lstCat];
}

class CategoryLoadingFail extends CategoryState {}
