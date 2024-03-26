/*
  Create by: Thach
  Date: 9:00 8/3
  Content: Giao dien add address text field
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/add_address_form/add_address_bloc.dart';
import '../widgets/show_validator.dart';

class AddAdressForm extends StatefulWidget {
  const AddAdressForm({super.key});

  @override
  State<AddAdressForm> createState() => _AddAdressFormState();
}

class _AddAdressFormState extends State<AddAdressForm> {
  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
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
                      onChanged: (final value) => context
                          .read<AddAddressBloc>()
                          .add(CheckFirstNameTextField(text: value)),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                          ),
                      decoration: InputDecoration(
                        hintText: 'First Name',
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
                    BlocBuilder<AddAddressBloc, AddAddressState>(
                      builder: (final context, final state) {
                        return ShowValidator(
                          isValid: state.isValidFirstName,
                          validate: state.firstNameMessage,
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
                      onChanged: (final value) => context
                          .read<AddAddressBloc>()
                          .add(CheckLastNameTextField(text: value)),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                          ),
                      decoration: InputDecoration(
                        hintText: 'Last Name',
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
                    BlocBuilder<AddAddressBloc, AddAddressState>(
                      builder: (final context, final state) {
                        return ShowValidator(
                          isValid: state.isValidLastName,
                          validate: state.lastNameMessage,
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
            onChanged: (final value) => context
                .read<AddAddressBloc>()
                .add(CheckAddressTextField(text: value)),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.black,
                ),
            decoration: InputDecoration(
              hintText: 'Address',
              hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
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
                isValid: state.isValidAddress,
                validate: state.addressMessage,
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
            onChanged: (final value) => context
                .read<AddAddressBloc>()
                .add(CheckCityTextField(text: value)),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.black,
                ),
            decoration: InputDecoration(
              hintText: 'City',
              hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
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
                isValid: state.isValidCity,
                validate: state.cityMessage,
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
                      onChanged: (final value) => context
                          .read<AddAddressBloc>()
                          .add(CheckStateTextField(text: value)),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                          ),
                      decoration: InputDecoration(
                        hintText: 'State',
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
                    BlocBuilder<AddAddressBloc, AddAddressState>(
                      builder: (final context, final state) {
                        return ShowValidator(
                          isValid: state.isValidState,
                          validate: state.stateMessage,
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
                      onChanged: (final value) => context
                          .read<AddAddressBloc>()
                          .add(CheckZipCodeTextField(text: value)),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                          ),
                      decoration: InputDecoration(
                        hintText: 'Zip Code',
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
                    BlocBuilder<AddAddressBloc, AddAddressState>(
                      builder: (final context, final state) {
                        return ShowValidator(
                          isValid: state.isValidZipCode,
                          validate: state.zipCodeMessage,
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
            onChanged: (final value) => context
                .read<AddAddressBloc>()
                .add(CheckPhoneTextField(text: value)),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.black,
                ),
            decoration: InputDecoration(
              hintText: 'Phone Number',
              hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
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
                isValid: state.isValidPhoneNumber,
                validate: state.phoneNumberMessage,
              );
            },
          ),
        ),
      ],
    );
  }
}
