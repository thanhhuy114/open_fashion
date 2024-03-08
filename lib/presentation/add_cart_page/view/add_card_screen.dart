/*
  Create by:Thach
  Date: 7/3 16:18
  content: Add new cart screen
*/

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/appbar_custom_widget.dart';
import '../../../widgets/button.dart';
import '../../../widgets/tittle_widget.dart';
import '../bloc/card_form/card_form_bloc.dart';
import 'card_form.dart';
import 'card_item.dart';

class AddCarDProviderScreen extends StatelessWidget {
  const AddCarDProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      body: Column(
        children: [
          //body
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Title
                  TittleWidget(
                    text: 'Add cart'.toUpperCase(),
                  ),

                  //List Cart
                  CarouselSlider(
                    items: const [
                      CardItem(
                        cardName: 'Card Name',
                        cardNumber: '2365 3654 2365 3698',
                        expDate: '03/25',
                        cardLogoUrl: '2',
                        backgroundColor: Colors.amber,
                      ),
                      CardItem(
                        cardName: 'Card Name',
                        cardNumber: '2365 3654 2365 3698',
                        expDate: '03/25',
                        cardLogoUrl: '2',
                      ),
                      CardItem(
                        cardName: 'Card Name',
                        cardNumber: '2365 3654 2365 3698',
                        expDate: '03/25',
                        cardLogoUrl: '2',
                        backgroundColor: Colors.redAccent,
                      ),
                    ],
                    options: CarouselOptions(viewportFraction: 0.9),
                  ),

                  //Form
                  BlocProvider(
                    create: (context) => CardFormBloc(),
                    child: const CardForm(),
                  )
                ],
              ),
            ),
          ),

          //button
          BottomButtonCustom(
            content: 'Add Cart',
            height: 56,
            width: MediaQuery.of(context).size.width,
            onTap: () {},
          )
        ],
      ),
    );
  }
}
