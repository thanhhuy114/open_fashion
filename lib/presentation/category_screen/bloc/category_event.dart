part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {
  const CategoryEvent();

  List<Object> get props => [];
}

class CategoryLoadEvent extends CategoryEvent {
  const CategoryLoadEvent({this.lstCat = const <Cat>[]});
  final List<Cat> lstCat;

  @override
  List<Object> get props => [lstCat];
}
