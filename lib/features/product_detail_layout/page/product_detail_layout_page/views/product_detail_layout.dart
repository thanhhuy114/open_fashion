// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../locator.dart';
import '../../../../product_detail/page/product_detail_page/cubit/pick_color/color_cubit.dart';
import '../../../../product_detail/page/product_detail_page/cubit/pick_favorie/favorite_cubit.dart';
import '../../../../product_detail/page/product_detail_page/cubit/pick_size/size_cubit.dart';
import '../../../../product_detail/page/product_detail_page/widgets/button_basket.dart';
import '../../../../product_detail/page/product_detail_page/widgets/choose_size.dart';
import '../../../../product_detail/page/product_detail_page/widgets/item_arrow_up_down.dart';
import '../../../../product_detail/page/product_detail_page/widgets/item_content_show.dart';
import '../../../../product_detail/page/product_detail_page/widgets/may_so_like.dart';
import '../../../../product_detail/page/product_detail_page/widgets/slide_show.dart';
import '../../../../../widgets/appbar_custom_widget.dart';
import '../../../../../widgets/footer.dart';
import '../../../../../widgets/menu_drawer_widget.dart';
import '../../../../../widgets/my_color.dart';
import '../bloc/remote_product_detail_layout_bloc.dart';

class ProductDetailLayoutPage extends StatefulWidget {
  const ProductDetailLayoutPage({super.key});

  @override
  State<ProductDetailLayoutPage> createState() =>
      _ProductDetailLayoutPageState();
}

class _ProductDetailLayoutPageState extends State<ProductDetailLayoutPage> {
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

  final RemoteProductDetailLayoutBloc _remoteProductDetailLayoutBloc =
      RemoteProductDetailLayoutBloc(sl());
  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteProductDetailLayoutBloc>(
          create: (final context) => _remoteProductDetailLayoutBloc
            ..add(const GetProductDetailLayout()),
        ),
        BlocProvider(create: (final context) => SizeCubit()),
        BlocProvider(create: (final context) => ColorCubit()),
        BlocProvider(create: (final context) => FavoriteCubit()),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarCustom(),
        body: BlocBuilder<RemoteProductDetailLayoutBloc,
            RemoteProductDetailLayoutState>(
          builder: (final context, final state) {
            switch (state) {
              case RemoteProductDetailLayoutLoading():
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RemoteProductDetailLayoutDone():
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
                        child: Column(
                          children: [
                            SlideShowProductDetail(
                              image: state.productDetailLayout!.image,
                              checkCategory: true,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      state
                                          .productDetailLayout!.productItem.name
                                          !.toUpperCase(),
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
                                  state.productDetailLayout!.productItem
                                      .description!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  r'$'
                                  // ignore: lines_longer_than_80_chars
                                  '${state.productDetailLayout!.productItem.price!.toStringAsFixed(0)}',
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
                                  ChooseSize(
                                    sizeModel:
                                        state.productDetailLayout!.ringSize,
                                    titleSize: 'Ring Size',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      ButtonBasket(
                        productItem: state.productDetailLayout!.productItem,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            const Text(
                              'GALLERY',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 15),
                            Expanded(
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    state.productDetailLayout!.gallery.length,
                                itemBuilder: (final context, final index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Image.network(
                                      state.productDetailLayout!.gallery[index]
                                          .url!,
                                    ),
                                  );
                                },
                              ),
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
                              content: state.productDetailLayout!.carePolicy
                                  .shippingInfo!,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 34, right: 16),
                              child: Divider(height: 1),
                            ),
                            ItemPolicy(
                              checkArrow: checkedCod,
                              name: 'COD Policy',
                              icon: const Icon(Icons.discount_outlined),
                            ),
                            ItemContentShow(
                              checked: checkCod,
                              name: 'Estimated to be delivered on',
                              content: state
                                  .productDetailLayout!.carePolicy.codPolicy!,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 34, right: 16),
                              child: Divider(height: 1),
                            ),
                            ItemPolicy(
                              checkArrow: checkedRePolicy,
                              name: 'Return Policy',
                              icon: const Icon(Icons.restart_alt_outlined),
                            ),
                            ItemContentShow(
                              checked: checkRePolicy,
                              name: 'Estimated to be delivered on',
                              content: state.productDetailLayout!.carePolicy
                                  .returnPolicy!,
                            ),
                          ],
                        ),
                      ),
                      MaySoLike(
                        category: state.productDetailLayout!.categories,
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
        drawer: MenuDrawer(),
      ),
    );
  }
}
