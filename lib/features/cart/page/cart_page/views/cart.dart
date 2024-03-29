import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../locator.dart';
import '../../../../../widgets/my_color.dart';
import '../../../../../presentation/checkout_page/view/checkout_screen.dart';
import '../../../../complete_checkout/pages/complete_checkout_page/cubit/counter/counter_cubit.dart';
import '../../../../complete_checkout/pages/complete_checkout_page/cubit/total/total_cubit.dart';
import '../../../../complete_checkout/pages/complete_checkout_page/widgets/button_custom.dart';
import '../../../../complete_checkout/pages/complete_checkout_page/widgets/item_product.dart';
import '../../../../complete_checkout/data/models/checkout_response_model.dart';
import '../bloc/remote_cart_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, required this.products});
  final List<ProductItem> products;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double total = 0.0;

  double calculateInitialTotal(
    final List<ProductItem> products,
    final int quantity,
  ) {
    for (final product in products) {
      total += quantity * product.price!;
    }
    return total;
  }

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteCartBloc>(
          create: (final context) =>
              sl()..add(const GetRemoteCartEvent()),
        ),
        BlocProvider(
          create: (final context) => TotalCubit(total),
        ),
        BlocProvider(
          create: (final context) => CounterCubit(),
        ),
      ],
      child: BlocBuilder<CounterCubit, int>(
        builder: (final context, final state) {
          return Scaffold(
            body: BlocBuilder<RemoteCartBloc, RemoteCartState>(
              builder: (final context, final state) {
                switch (state) {
                  case RemoteCartLoading():
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case RemoteCartDone():
                    total = calculateInitialTotal(
                      state.cart!.cartInfoModel,
                      context.read<CounterCubit>().state,
                    );
                    return Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: const Icon(Icons.close),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'CART',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Expanded(
                                  child: state.cart!.cartInfoModel.isEmpty
                                      ? const Align(
                                          child: Expanded(
                                            child: Text(
                                              // ignore: lines_longer_than_80_chars
                                              'You have no items in your Shopping Bag.',
                                            ),
                                          ),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              // ignore: lines_longer_than_80_chars
                                              const NeverScrollableScrollPhysics(),
                                          itemCount:
                                              state.cart!.cartInfoModel.length,
                                          itemBuilder:
                                              (final context, final index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 16,
                                              ),
                                              child: ItemProduct(
                                                productItem: state
                                                    .cart!.cartInfoModel[index],
                                              ),
                                            );
                                          },
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              if (state.cart!.cartInfoModel.isEmpty)
                                Container()
                              else
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 16, 16, 28),
                                  child: Column(
                                    children: [
                                      const Divider(),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'SUB TOTAl',
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          BlocBuilder<TotalCubit, double>(
                                            builder:
                                                (final context, final state) {
                                              return Text(
                                                r'$'
                                                // ignore: lines_longer_than_80_chars
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
                                      const SizedBox(height: 16),
                                      const Text(
                                        // ignore: lines_longer_than_80_chars
                                        '*shipping charges, taxes and discount codes are calculated at the time of accounting. ',
                                        style: TextStyle(fontSize: 16.5),
                                      ),
                                    ],
                                  ),
                                ),
                              if (state.cart!.cartInfoModel.isEmpty)
                                ButtonCustom(
                                  message: 'CONTINUE SHOPPING',
                                  onTap: () {},
                                  icon: const Icon(Icons.shopping_bag_outlined),
                                  checkLR: true,
                                )
                              else
                                ButtonCustom(
                                  message: 'BUY NOW',
                                  onTap: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (final context) =>
                                             CheckOutScreen(),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Colors.white,
                                  ),
                                  checkLR: true,
                                ),
                            ],
                          ),
                        ),
                      ],
                    );
                  default:
                    return Container();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
