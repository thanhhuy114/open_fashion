/*
  Create by: Thach
  Date: 9:40 7/3
  Content: Add new address screen

  Modify
  Date: 8/3 10:14 
  Content: tach add address form -> addaddressform.dart
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/appbar_custom_widget.dart';
import '../widgets/button.dart';
import '../../../widgets/tittle_widget.dart';
import '../bloc/add_address_form/add_address_bloc.dart';
import 'add_address_form.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //title
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TittleWidget(
                      text: 'Add Shipping Address'.toUpperCase(),
                    ),
                  ),

                  BlocProvider(
                    create: (final context) => AddAddressBloc(),
                    child: const AddAdressForm(),
                  ),
                ],
              ),
            ),
          ),
          BottomButtonCustom(
            content: 'Add Address',
            height: 56,
            width: MediaQuery.of(context).size.width,
            leading: Image.asset(
              'assets/icons/shopping bag.png',
              width: 20,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
