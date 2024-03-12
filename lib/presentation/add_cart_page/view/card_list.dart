import 'package:banner_carousel/banner_carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/card_list_bloc.dart';
import '../widgets/indicator.dart';
import 'card_item.dart';

class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  PageController controller = PageController(viewportFraction: 0.9);
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardListBloc, CardListState>(
      builder: (context, state) {
        if (state is CardListLoaded) {
          return Column(
            children: [
              SizedBox(
                height: 200,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  controller: controller,
                  itemCount: state.cards.length,
                  itemBuilder: (context, index) {
                    return CardItem(
                      cardNumber: state.cards[index].cardNumber ?? '',
                      expDate:
                          '${state.cards[index].expMonth}/${state.cards[index].expDate}',
                      cardName: state.cards[index].nameOnCard ?? '',
                    );
                  },
                ),
              ),
              Indicatior(
                active: currentPage,
                total: state.cards.length,
              ),
            ],
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
