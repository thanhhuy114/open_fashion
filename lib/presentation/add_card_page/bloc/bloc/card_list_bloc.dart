import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/card_response_model.dart';
import '../../../../network/api.dart';

part 'card_list_event.dart';
part 'card_list_state.dart';

class CardListBloc extends Bloc<CardListEvent, CardListState> {
  CardListBloc() : super(CardListInitial()) {
    on<LoadCardList>(fetchCardList);
  }

  //Load card
  Future<void> fetchCardList(
    final LoadCardList event,
    final Emitter<CardListState> emit,
  ) async {
    //
    emit(CardListLoanding());
    try {
      final cards = await Api.getCards();
      if (cards.data != null) {
        emit(CardListLoaded(cards: cards.data!));
      } else {
        emit(CardListFailure());
      }
    } catch (_) {
      emit(CardListFailure());
    }
  }
}
