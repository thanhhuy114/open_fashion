/*
  Create by: Thach
  Date: 9:40 7/3
  Content: Add new address screen
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/appbar_custom_widget.dart';
import '../../../widgets/button.dart';
import '../../../widgets/tittle_widget.dart';
import '../bloc/bloc/add_address_bloc.dart';
import '../widget/show_validator.dart';

class AddAddressProviderScreen extends StatelessWidget {
  const AddAddressProviderScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => AddAddressBloc(),
      child: const AddAddressScreen(),
    );
  }
}

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController phoneNmberController = TextEditingController();

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
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

                  //first and last name
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              TextField(
                                controller: firstNameController,
                                onChanged: (final value) => context
                                    .read<AddAddressBloc>()
                                    .add(CheckFirstNameTextField(text: value)),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                                decoration: InputDecoration(
                                  hintText: 'First Name',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: const Color.fromRGBO(
                                          151,
                                          151,
                                          151,
                                          1,
                                        ),
                                      ),
                                ),
                              ),
                              BlocBuilder<AddAddressBloc, AddAddressState>(
                                builder: (final context, final state) {
                                  return ShowValidator(
                                    isValid: state.firstNameTextField,
                                    validate: 'InValid',
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
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextField(
                                controller: lastNameController,
                                onChanged: (final value) => context
                                    .read<AddAddressBloc>()
                                    .add(CheckLastNameTextField(text: value)),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                                decoration: InputDecoration(
                                  hintText: 'Last Name',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: const Color.fromRGBO(
                                          151,
                                          151,
                                          151,
                                          1,
                                        ),
                                      ),
                                ),
                              ),
                              BlocBuilder<AddAddressBloc, AddAddressState>(
                                builder: (final context, final state) {
                                  return ShowValidator(
                                    isValid: state.lastNameTextField,
                                    validate: 'InValid',
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //address
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: TextField(
                      controller: addressController,
                      onChanged: (final value) => context
                          .read<AddAddressBloc>()
                          .add(CheckAddressTextField(text: value)),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                          ),
                      decoration: InputDecoration(
                        hintText: 'Address',
                        hintStyle:
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: const Color.fromRGBO(
                                    151,
                                    151,
                                    151,
                                    1,
                                  ),
                                ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: BlocBuilder<AddAddressBloc, AddAddressState>(
                      builder: (final context, final state) {
                        return ShowValidator(
                          isValid: state.addressTextField,
                          validate: 'InValid',
                        );
                      },
                    ),
                  ),

                  //City
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: TextField(
                      controller: cityController,
                      onChanged: (final value) => context
                          .read<AddAddressBloc>()
                          .add(CheckCityTextField(text: value)),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                          ),
                      decoration: InputDecoration(
                        hintText: 'City',
                        hintStyle:
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: const Color.fromRGBO(
                                    151,
                                    151,
                                    151,
                                    1,
                                  ),
                                ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: BlocBuilder<AddAddressBloc, AddAddressState>(
                      builder: (final context, final state) {
                        return ShowValidator(
                          isValid: state.cityTextField,
                          validate: 'InValid',
                        );
                      },
                    ),
                  ),

                  //State and zip code
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              TextField(
                                controller: stateController,
                                onChanged: (final value) => context
                                    .read<AddAddressBloc>()
                                    .add(CheckStateTextField(text: value)),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                                decoration: InputDecoration(
                                  hintText: 'State',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: const Color.fromRGBO(
                                          151,
                                          151,
                                          151,
                                          1,
                                        ),
                                      ),
                                ),
                              ),
                              BlocBuilder<AddAddressBloc, AddAddressState>(
                                builder: (final context, final state) {
                                  return ShowValidator(
                                    isValid: state.stateTextField,
                                    validate: 'InValid',
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
                                controller: zipCodeController,
                                onChanged: (final value) => context
                                    .read<AddAddressBloc>()
                                    .add(CheckZipCodeTextField(text: value)),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                                decoration: InputDecoration(
                                  hintText: 'Zip Code',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: const Color.fromRGBO(
                                          151,
                                          151,
                                          151,
                                          1,
                                        ),
                                      ),
                                ),
                              ),
                              BlocBuilder<AddAddressBloc, AddAddressState>(
                                builder: (final context, final state) {
                                  return ShowValidator(
                                    isValid: state.zipCodeTextField,
                                    validate: 'InValid',
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //phone number
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: TextField(
                      controller: phoneNmberController,
                      onChanged: (final value) => context
                          .read<AddAddressBloc>()
                          .add(CheckPhoneTextField(text: value)),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                          ),
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        hintStyle:
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: const Color.fromRGBO(
                                    151,
                                    151,
                                    151,
                                    1,
                                  ),
                                ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: BlocBuilder<AddAddressBloc, AddAddressState>(
                      builder: (final context, final state) {
                        return ShowValidator(
                          isValid: state.phoneNumberTextField,
                          validate: 'InValid',
                        );
                      },
                    ),
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
