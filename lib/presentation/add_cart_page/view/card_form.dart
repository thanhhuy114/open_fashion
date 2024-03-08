import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../add_address_page/widget/show_validator.dart';
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          //Name of cart Textfield
          TextField(
            onChanged: (value) => context.read<CardFormBloc>().add(
                  CheckNameOnCardTextField(
                    text: value,
                  ),
                ),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.black,
                ),
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              focusColor: Colors.amber,
              label: Text('Name On Card'),
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          BlocBuilder<CardFormBloc, CardFormState>(
            builder: (context, state) {
              return ShowValidator(
                isValid: !state.isValidNameOnCard,
                validate: state.nameOnCardMessage,
              );
            },
          ),

          //Number of cart textfield
          TextField(
            onChanged: (value) => context.read<CardFormBloc>().add(
                  CheckCardNumberTextField(
                    text: value,
                  ),
                ),
            // ignore: use_named_constants
            keyboardType: const TextInputType.numberWithOptions(),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.black,
                ),
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              focusColor: Colors.amber,
              label: Text('Card Number'),
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          BlocBuilder<CardFormBloc, CardFormState>(
            builder: (context, state) {
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
                      onChanged: (value) => context.read<CardFormBloc>().add(
                            CheckExpMonthTextField(
                              text: value,
                            ),
                          ),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                          ),
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
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
                      builder: (context, state) {
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
                      onChanged: (value) => context.read<CardFormBloc>().add(
                            CheckExpDateTextField(
                              text: value,
                            ),
                          ),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                          ),
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
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
                      builder: (context, state) {
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
            onChanged: (value) => context.read<CardFormBloc>().add(
                  CheckCVVTextField(text: value),
                ),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.black,
                ),
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
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
            builder: (context, state) {
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
