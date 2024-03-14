import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../add_address_page/widgets/show_validator.dart';
import '../bloc/card_form/card_form_bloc.dart';

/*
 Create by: Thach
 Date: 8/3: 10:00
 Content: Giao dien text field 
*/
class CardForm extends StatefulWidget {
  const CardForm({super.key});

  @override
  State<CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  TextEditingController cardNumber = TextEditingController();

  String formatVisaCardNumber(String cardNumber) {
    cardNumber = cardNumber.replaceAll(RegExp(r'\D+'), '');
    final formattedNumber = StringBuffer();
    for (int i = 0; i < cardNumber.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formattedNumber.write(' ');
      }
      formattedNumber.write(cardNumber[i]);
    }
    return formattedNumber.toString();
  }

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          //Name of cart Textfield
          TextField(
            onChanged: (final value) => context.read<CardFormBloc>().add(
                  CheckNameOnCardTextField(
                    text: value,
                  ),
                ),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.black,
                ),
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(),
              focusColor: Colors.amber,
              label: Text('Name On Card'),
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          BlocBuilder<CardFormBloc, CardFormState>(
            builder: (final context, final state) {
              return ShowValidator(
                isValid: !state.isValidNameOnCard,
                validate: state.nameOnCardMessage,
              );
            },
          ),

          //Number of cart textfield
          TextField(
            controller: cardNumber,
            onChanged: (final value) {
              cardNumber.text = formatVisaCardNumber(value);
              context.read<CardFormBloc>().add(
                    CheckCardNumberTextField(
                      text: value.replaceAll(' ', ''),
                    ),
                  );
            },
            // ignore: use_named_constants
            keyboardType: const TextInputType.numberWithOptions(),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.black,
                ),
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(),
              focusColor: Colors.amber,
              label: Text('Card Number'),
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          BlocBuilder<CardFormBloc, CardFormState>(
            builder: (final context, final state) {
              return ShowValidator(
                isValid: !state.isValidCardNumber,
                validate: state.cardNumberMessage,
              );
            },
          ),

          //Exp Month and Exp Date textfield
          Row(
            children: [
              Flexible(
                child: Column(
                  children: [
                    TextField(
                      onChanged: (final value) =>
                          context.read<CardFormBloc>().add(
                                CheckExpMonthTextField(
                                  text: value,
                                ),
                              ),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                          ),
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(),
                        focusColor: Colors.amber,
                        label: Text('Exp Month'),
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      // ignore: use_named_constants
                      keyboardType: const TextInputType.numberWithOptions(),
                    ),
                    BlocBuilder<CardFormBloc, CardFormState>(
                      builder: (final context, final state) {
                        return ShowValidator(
                          isValid: !state.isValidExpMonth,
                          validate: state.expMonthMessage,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: Column(
                  children: [
                    TextField(
                      onChanged: (final value) =>
                          context.read<CardFormBloc>().add(
                                CheckExpDateTextField(
                                  text: value,
                                ),
                              ),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                          ),
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(),
                        focusColor: Colors.amber,
                        label: Text('Exp Date'),
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      // ignore: use_named_constants
                      keyboardType: const TextInputType.numberWithOptions(),
                    ),
                    BlocBuilder<CardFormBloc, CardFormState>(
                      builder: (final context, final state) {
                        return ShowValidator(
                          isValid: !state.isValidExpDate,
                          validate: state.expDateMessage,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),

          //CVv textfield
          TextField(
            onChanged: (final value) => context.read<CardFormBloc>().add(
                  CheckCVVTextField(text: value),
                ),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.black,
                ),
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(),
              focusColor: Colors.amber,
              label: Text('CVV'),
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            // ignore: use_named_constants
            keyboardType: const TextInputType.numberWithOptions(),
          ),
          BlocBuilder<CardFormBloc, CardFormState>(
            builder: (final context, final state) {
              return ShowValidator(
                isValid: !state.isValidCvv,
                validate: state.cvvMessage,
              );
            },
          ),
        ],
      ),
    );
  }
}
