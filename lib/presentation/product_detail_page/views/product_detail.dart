// ignore_for_file: avoid_positional_boolean_parameters
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/appbar_custom_widget.dart';
import '../../../widgets/footer.dart';
import '../../../widgets/menu_drawer_widget.dart';
import '../bloc/product_detail_bloc.dart';
import '../cubit/pick_color/color_cubit.dart';
import '../cubit/pick_favorie/favorite_cubit.dart';
import '../cubit/pick_size/size_cubit.dart';
import '../widgets/button_basket.dart';
import '../widgets/choose_color.dart';
import '../widgets/choose_size.dart';
import '../widgets/item_arrow_up_down.dart';
import '../widgets/item_content_show.dart';
import '../widgets/item_reminder.dart';
import '../widgets/may_so_like.dart';
import '../widgets/slide_show.dart';
import '../../../widgets/my_color.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool checkShipping = false;
  bool checkCod = false;
  bool checkRePolicy = false;

  int lenghtSoLike = 0;

  void checkedShipping(final bool checkArr) {
    setState(() {
      checkShipping = checkArr;
    });
  }

  void checkedCod(final bool checkArr) {
    setState(() {
      checkCod = checkArr;
    });
  }

  void checkedRePolicy(final bool checkArr) {
    setState(() {
      checkRePolicy = checkArr;
    });
  }

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (final context) =>
              ProductDetailBloc()..add(ProductDetailLoadedEvent()),
        ),
        BlocProvider(create: (final context) => SizeCubit()),
        BlocProvider(create: (final context) => ColorCubit()),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const AppBarCustom(),
        drawer: const MenuDrawer(),
        body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (final context, final state) {
            switch (state) {
              case ProductDetailLoading():
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ProductDetailLoaded():
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
                        child: Column(
                          children: [
                            BlocBuilder<ColorCubit, int>(
                              builder: (final context, final stateColor) {
                                return SlideShowProductDetail(
                                  image: state
                                      .productDetailModel!
                                      .color![context.read<ColorCubit>().state]
                                      .image!,
                                  checkCategory: false,
                                );
                              },
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      state.productDetailModel!.productItem!
                                          .name!
                                          .toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Icon(Icons.save_alt_outlined),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  state.productDetailModel!.productItem!
                                      .description!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  r'$'
                                  '${state.productDetailModel!.productItem!.price!.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: MyColor.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 28,
                              child: Row(
                                children: [
                                  ChooseColor(
                                    productDetailModel:
                                        state.productDetailModel!,
                                  ),
                                  ChooseSize(
                                    sizeModel: state.productDetailModel!.size!,
                                    titleSize: 'Size',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      BlocProvider(
                        create: (final context) => FavoriteCubit(),
                        child: ButtonBasket(
                          productItem: state.productDetailModel!.productItem!,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              'MATERIALS',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              state.productDetailModel!.material!,
                              style: const TextStyle(letterSpacing: 1),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'CARE',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              state.productDetailModel!.care!.cleaning!,
                              style: const TextStyle(letterSpacing: 1),
                            ),
                            const SizedBox(height: 15),
                            ItemReminder(
                              image:
                                  'https://res.cloudinary.com/dc4nkguls/image/upload/v1709634244/OpenFashion/icons/gggpxdqplzgxna188jgr.png',
                              txtReminder:
                                  state.productDetailModel!.care!.doNotUse!,
                            ),
                            ItemReminder(
                              image:
                                  'https://res.cloudinary.com/dc4nkguls/image/upload/v1709634244/OpenFashion/icons/mcojiy7vvj8ztphkggde.png',
                              txtReminder:
                                  state.productDetailModel!.care!.doNot!,
                            ),
                            ItemReminder(
                              image:
                                  'https://res.cloudinary.com/dc4nkguls/image/upload/v1709634244/OpenFashion/icons/yre4zg8pd1asaaxdybr1.png',
                              txtReminder:
                                  state.productDetailModel!.care!.dryCleanWith!,
                            ),
                            ItemReminder(
                              image:
                                  'https://res.cloudinary.com/dc4nkguls/image/upload/v1709634245/OpenFashion/icons/jqyaewofjlqj3thkn9xa.png',
                              txtReminder: state.productDetailModel!.care!
                                  .ironAtMaxTemperature!,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'CARE',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 20),
                            ItemPolicy(
                              checkArrow: checkedShipping,
                              name: 'Free Flat Rate Shipping',
                              icon: const Icon(Icons.local_shipping_outlined),
                            ),
                            ItemContentShow(
                              checked: checkShipping,
                              name: 'Estimated to be delivered on',
                              content: state.productDetailModel!.care!
                                  .carePolicy!.shippingInfo!,
                            ),
                            ItemPolicy(
                              checkArrow: checkedCod,
                              name: 'COD Policy',
                              icon: const Icon(Icons.discount_outlined),
                            ),
                            ItemContentShow(
                              checked: checkCod,
                              name: 'Estimated to be delivered on',
                              content: state.productDetailModel!.care!
                                  .carePolicy!.codPolicy!,
                            ),
                            ItemPolicy(
                              checkArrow: checkedRePolicy,
                              name: 'Return Policy',
                              icon: const Icon(Icons.restart_alt_outlined),
                            ),
                            ItemContentShow(
                              checked: checkRePolicy,
                              name: 'Estimated to be delivered on',
                              content: state.productDetailModel!.care!
                                  .carePolicy!.returnPolicy!,
                            ),
                          ],
                        ),
                      ),
                      MaySoLike(
                        category: state.productDetailModel!.categories!,
                      ),
                      const FooterWidget(),
                    ],
                  ),
                );
              default:
                return Center(
                  child: Text(state.runtimeType.toString()),
                );
            }
          },
        ),
      ),
    );
  }
}
