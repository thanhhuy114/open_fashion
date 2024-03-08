import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/checkout_response_model.dart';
import '../../../widgets/appbar_custom_widget.dart';
import '../../../widgets/menu_drawer_widget.dart';
import '../../../widgets/my_color.dart';
import '../../checkout_layout_page/view/checkout_layout_screen.dart';
import '../../complete_checkout_page/bloc/complete_checkout_bloc.dart';
import '../../complete_checkout_page/cubit/counter/counter_cubit.dart';
import '../../complete_checkout_page/cubit/total/total_cubit.dart';
import '../../complete_checkout_page/widgets/button_custom.dart';
import '../../complete_checkout_page/widgets/item_product.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    double total = 0.0;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (final context) =>
              CompleteCheckoutBloc()..add(CompleteCheckoutLoadedEvent()),
        ),
        BlocProvider(
          create: (final context) => TotalCubit(total),
        ),
        BlocProvider(
          create: (final context) => CounterCubit(),
        ),
      ],
      child: BlocBuilder<CompleteCheckoutBloc, CompleteCheckoutState>(
        builder: (final context, final state) {
          if (state is CompleteCheckoutLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is CompleteCheckoutError) {
            return const Scaffold(
              body: Center(
                child: Text('Something went wrong!'),
              ),
            );
          }
          if (state is CompleteCheckoutLoaded) {
            total = calculateInitialTotal(
              state.checkoutModel!.checkout!.product!,
              context.read<CounterCubit>().state,
            );
            return Scaffold(
              appBar: const AppBarCustom(),
              drawer: const MenuDrawer(),
              body: Container(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Text(
                      'CHECKOUT',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        letterSpacing: 4,
                      ),
                    ),
                    Image.asset('assets/img/3.png'),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.checkoutModel!.checkout!.product!.length,
                      itemBuilder: (final context, final index) {
                        return ItemProduct(
                          productItem:
                              state.checkoutModel!.checkout!.product![index],
                        );
                      },
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    ListTile(
                      leading: Image.asset('assets/img/Voucher.png'),
                      title: const Text(
                        'Add promo code',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    ListTile(
                      leading:
                          Image.asset('assets/img/Door to Door Delivery.png'),
                      title: const Text(
                        'Delivery',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      trailing: const Text(
                        'Free',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'EST. TOTAL',
                          style: TextStyle(fontSize: 14),
                        ),
                        BlocBuilder<TotalCubit, double>(
                          builder: (final context, final state) {
                            return Text(
                              r'$'
                              '${context.read<TotalCubit>().state.toInt()}',
                              style: const TextStyle(
                                fontSize: 17,
                                color: MyColor.primaryColor,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              bottomSheet: ButtonCustom(
                message: 'CHECKOUT',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (final context) => CheckOutLayOutScreen(
                          total: total,
                        ),
                      ));
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
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

double total(final double price, final int quantity) {
  final double total = price * quantity;
  return total;
}
