part of 'card_list_bloc.dart';

abstract class CardListState extends Equatable {
  const CardListState();

  @override
  List<Object> props() => [];
}

class CardListInitial extends CardListState {}

class CardListLoanding extends CardListState {}

class CardListLoaded extends CardListState {
  const CardListLoaded({required this.cards});

  final List<CardModel> cards;
}

class CardListFailure extends CardListState {}
