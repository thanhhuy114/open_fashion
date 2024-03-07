part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {
  const CategoryEvent();

  List<Object> get props => [];
}

class CategoryLoadEvent extends CategoryEvent {
  final List<Cat> lstCat;

  const CategoryLoadEvent({this.lstCat = const <Cat>[]});

  @override
  List<Object> get props => [lstCat];
}
