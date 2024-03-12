import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/card_list_bloc.dart';
import 'card_item.dart';

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardListBloc, CardListState>(
      builder: (context, state) {
        if (state is CardListLoaded) {
          return CarouselSlider(
            items: state.cards
                .map(
                  (e) => CardItem(
                    cardNumber: e.cardNumber!,
                    expDate: '${e.expMonth}/${e.expDate}',
                    cardName: e.nameOnCard!,
                  ),
                )
                .toList(),
            options: CarouselOptions(viewportFraction: 0.9),
          );
        }
        return SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
