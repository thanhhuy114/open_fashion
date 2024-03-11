// ignore_for_file: lines_longer_than_80_chars, must_be_immutable

import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/checkout_response_model.dart';
import '../../../widgets/appbar_custom_widget.dart';
import '../../../widgets/menu_drawer_widget.dart';
import '../../../widgets/my_color.dart';
import '../../../widgets/tittle_widget.dart';
import '../../payment_page/views/payment.dart';
import '../bloc/complete_checkout_bloc.dart';
import '../cubit/counter/counter_cubit.dart';
import '../cubit/total/total_cubit.dart';
import '../widgets/button_custom.dart';
import '../widgets/item_product.dart';

class CompleteCheckoutPage extends StatelessWidget {
  CompleteCheckoutPage({super.key});
  String getLastTwoDigits(final String text) {
    if (text.length >= 2) {
      return text.substring(text.length - 2);
    } else {
      return text;
    }
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

  double? total = 0.0;

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (final context) =>
              CompleteCheckoutBloc()..add(CompleteCheckoutLoadedEvent()),
        ),
        BlocProvider(
          create: (final context) => TotalCubit(total!),
        ),
        BlocProvider(
          create: (final context) => CounterCubit(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarCustom(),
        drawer:  MenuDrawer(),
        body: BlocBuilder<CompleteCheckoutBloc, CompleteCheckoutState>(
          builder: (final context, final state) {
            switch (state) {
              case CompleteCheckoutLoading():
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              case CompleteCheckoutLoaded():
                total = calculateInitialTotal(
                  state.checkoutModel!.checkout!.product!,
                  context.read<CounterCubit>().state,
                );
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            const TittleWidget(text: 'CHECKOUT'),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.checkoutModel!.checkout!
                                              .address!,
                                          style: const TextStyle(
                                            fontSize: 18.5,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                        Text(
                                          state.checkoutModel!.checkout!
                                              .addressDetail!,
                                          style: const TextStyle(
                                            height: 1.6,
                                            fontSize: 17,
                                          ),
                                        ),
                                        Text(
                                          state.checkoutModel!.checkout!
                                              .phoneNumber!,
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
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Divider(),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.network(
                                    'https://res.cloudinary.com/dc4nkguls/image/upload/v1709785886/OpenFashion/icons/ereyla5zjmlsqvrgwegs.png',
                                  ),
                                  Text(
                                    'Master Card ending ####${getLastTwoDigits(state.checkoutModel!.checkout!.masterCard!)}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                    ),
                                  ),
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
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Divider(),
                            ),
                            const SizedBox(height: 16),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state
                                  .checkoutModel!.checkout!.product!.length,
                              itemBuilder: (final context, final index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                  child: ItemProduct(
                                    productItem: state.checkoutModel!.checkout!
                                        .product![index],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'TOTAL',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  BlocBuilder<TotalCubit, double>(
                                    builder: (final context, final state) {
                                      return Text(
                                        r'$'
                                        '${context.read<TotalCubit>().state}',
                                        style: const TextStyle(
                                          fontSize: 17,
                                          color: MyColor.primaryColor,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            ButtonCustom(
                              message: 'CHECKOUT',
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (final context) => Padding(
                                    padding: const EdgeInsets.only(top: 78.0),
                                    child: FluidDialog(
                                      rootPage: FluidDialogPage(
                                        alignment: Alignment.topCenter,
                                        builder: (final context) =>
                                            const Payment(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.shopping_bag,
                                color: Colors.white,
                              ),
                              checkLR: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
