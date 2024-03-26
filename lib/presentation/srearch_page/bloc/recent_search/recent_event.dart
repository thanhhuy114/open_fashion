abstract class RecentSearchEvent {}

class RecentSearchEventLoad extends RecentSearchEvent {}

class RecentSearchEventAdd extends RecentSearchEvent {}

class RecenSearchEventDelete extends RecentSearchEvent {
  RecenSearchEventDelete({required this.item, required this.recenSearchs});

  final List<String> recenSearchs;
  final String item;
}
