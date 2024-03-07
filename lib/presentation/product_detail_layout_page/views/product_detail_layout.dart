import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_fashion/presentation/product_detail_layout_page/bloc/product_detail_layout_bloc.dart';
import 'package:open_fashion/presentation/product_detail_page/cubit/pick_color/color_cubit.dart';
import 'package:open_fashion/presentation/product_detail_page/cubit/pick_favorie/favorite_cubit.dart';
import 'package:open_fashion/presentation/product_detail_page/cubit/pick_size/size_cubit.dart';
import 'package:open_fashion/presentation/product_detail_page/widgets/button_basket.dart';
import 'package:open_fashion/presentation/product_detail_page/widgets/choose_size.dart';
import 'package:open_fashion/presentation/product_detail_page/widgets/item_arrow_up_down.dart';
import 'package:open_fashion/presentation/product_detail_page/widgets/item_content_show.dart';
import 'package:open_fashion/presentation/product_detail_page/widgets/may_so_like.dart';
import 'package:open_fashion/presentation/product_detail_page/widgets/slide_show.dart';
import 'package:open_fashion/widgets/my_color.dart';

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

  void checkedShipping(bool checkArr) {
    setState(() {
      checkShipping = checkArr;
    });
  }

  void checkedCod(bool checkArr) {
    setState(() {
      checkCod = checkArr;
    });
  }

  void checkedRePolicy(bool checkArr) {
    setState(() {
      checkRePolicy = checkArr;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductDetailLayoutBloc()..add(ProductDetailLayoutLoadedEvent()),
        ),
        BlocProvider(create: (context) => SizeCubit()),
        BlocProvider(create: (context) => ColorCubit()),
        BlocProvider(create: (context) => FavoriteCubit())
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Open Fashion'),
        ),
        body: BlocBuilder<ProductDetailLayoutBloc, ProductDetailLayoutState>(
          builder: (context, state) {
            switch (state) {
              case ProductDetailLayoutInitial():
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ProductDetailLayoutLoaded():
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
                              image: state.productDetailLayoutModel!.image!,
                              checkCategory: true,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      state.productDetailLayoutModel!.name!
                                          .toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Icon(Icons.save_alt_outlined)
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  state.productDetailLayoutModel!.description!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  r'$'
                                  '${state.productDetailLayoutModel!.price!.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: MyColor.primaryColor),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 28,
                              child: Row(
                                children: [
                                  ChooseSize(
                                    sizeModel: state
                                        .productDetailLayoutModel!.ringSize!,
                                    titleSize: 'Ring Size',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const ButtonBasket(),
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
                              itemCount: state
                                  .productDetailLayoutModel!.gallery!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Image.network(state
                                      .productDetailLayoutModel!
                                      .gallery![index]
                                      .url!),
                                );
                              },
                            )),
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
                                content: state.productDetailLayoutModel!
                                    .carePolicy!.shippingInfo!),
                            ItemPolicy(
                              checkArrow: checkedCod,
                              name: 'COD Policy',
                              icon: const Icon(Icons.discount_outlined),
                            ),
                            ItemContentShow(
                                checked: checkCod,
                                name: 'Estimated to be delivered on',
                                content: state.productDetailLayoutModel!
                                    .carePolicy!.codPolicy!),
                            ItemPolicy(
                              checkArrow: checkedRePolicy,
                              name: 'Return Policy',
                              icon: const Icon(Icons.restart_alt_outlined),
                            ),
                            ItemContentShow(
                                checked: checkRePolicy,
                                name: 'Estimated to be delivered on',
                                content: state.productDetailLayoutModel!
                                    .carePolicy!.returnPolicy!),
                          ],
                        ),
                      ),
                      MaySoLike(
                        category: state.productDetailLayoutModel!.categories!,
                      )
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
