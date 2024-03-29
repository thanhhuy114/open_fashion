import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/complete_checkout/data/models/checkout_response_model.dart';
import '../../../features/complete_checkout/pages/complete_checkout_page/bloc/remote_complete_checkout_bloc.dart';
import '../../../locator.dart';
import '../../../widgets/appbar_custom_widget.dart';
import '../../../widgets/menu_drawer_widget.dart';
import '../../../widgets/tittle_widget.dart';
import '../../add_address_page/view/add_address_screen.dart';
import '../../add_card_page/view/add_card_screen.dart';
import '../../../features/complete_checkout/pages/complete_checkout_page/cubit/counter/counter_cubit.dart';
import '../../../features/complete_checkout/pages/complete_checkout_page/cubit/total/total_cubit.dart';
import '../../../features/complete_checkout/pages/complete_checkout_page/views/complete_checkout.dart';
import '../../../features/complete_checkout/pages/complete_checkout_page/widgets/button_custom.dart';

class CheckOutLayOutScreen extends StatefulWidget {
  const CheckOutLayOutScreen({super.key, required this.total});
  final double total;

  @override
  State<CheckOutLayOutScreen> createState() => _CheckOutLayOutScreenState();
}


class _CheckOutLayOutScreenState extends State<CheckOutLayOutScreen> {
  @override
  Widget build(final BuildContext context) {
    const double total = 0.0;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (final context) => TotalCubit(total),
        ),
        BlocProvider(
          create: (final context) => CounterCubit(),
        ),
        BlocProvider<RemoteCompleteCheckoutBloc>(
          create: (final context) => sl()
            ..add(const GetRemoteCompleteCheckout()),
        ),
      ],
      child:
          BlocBuilder<RemoteCompleteCheckoutBloc, RemoteCompleteCheckoutState>(
        builder: (final context, final state) {
          if (state is RemoteCompleteCheckoutLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is RemoteCompleteCheckoutError) {
            return const Scaffold(
              body: Center(
                child: Text('Something went wrong!'),
              ),
            );
          }
          if (state is RemoteCompleteCheckoutDone) {
            return Scaffold(
              appBar: AppBarCustom(),
              drawer: MenuDrawer(),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Column(
                        children: [
                          TittleWidget(text: 'CHECKOUT'),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('SHIPPING ADDRESS'),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.completeCheckoutInfo!.address!,
                                      style: const TextStyle(
                                        fontSize: 18.5,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text(
                                      state
                                          .completeCheckoutInfo!.addressDetail!,
                                      style: const TextStyle(
                                        height: 1.6,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      state.completeCheckoutInfo!.phoneNumber!,
                                      style: const TextStyle(
                                        height: 1.7,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(249, 249, 249, 1),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Add shipping address',
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (final context) =>
                                              const AddAddressScreen(),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'SHIPPING METHOD',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              letterSpacing: 1,
                              color: Color.fromRGBO(136, 136, 136, 1),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(249, 249, 249, 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  // ignore: lines_longer_than_80_chars
                                  'Pickup at store                             FREE',
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'PAYMENT METHOD',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            letterSpacing: 1,
                            color: Color.fromRGBO(136, 136, 136, 1),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(249, 249, 249, 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('select payment method'),
                              IconButton(
                                onPressed: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (final context) =>
                                          const AddCardScreen(),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 130,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'TOTAL',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 3,
                          ),
                        ),
                        Text(
                          r'$' '${widget.total.toInt()}',
                          style: const TextStyle(
                            color: Color.fromRGBO(221, 133, 96, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              bottomSheet: ButtonCustom(
                message: 'PLACE ORDER',
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (final context) => CompleteCheckoutPage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
                checkLR: true,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  double calculateInitialTotal(
    final List<ProductItem> products,
    final int quantity,
  ) {
    double total = 0;
    for (final product in products) {
      total += quantity * product.price!;
    }
    return total;
  }
}
