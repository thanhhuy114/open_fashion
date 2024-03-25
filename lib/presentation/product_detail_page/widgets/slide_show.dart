// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/product_detail_response_models.dart';
import '../../../widgets/my_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../features/homepage/home_page/widgets/RhombusContainer.dart';
import '../cubit/pick_color/color_cubit.dart';
import 'rhombus_indicator.dart';

class SlideShowProductDetail extends StatefulWidget {
  const SlideShowProductDetail({
    super.key,
    required this.image,
    required this.checkCategory,
  });
  final List<ImageModel> image;
  final bool checkCategory;
  @override
  State<SlideShowProductDetail> createState() => _SlideShowProductDetailState();
}

class _SlideShowProductDetailState extends State<SlideShowProductDetail> {
  int activeIndex = 0;
  int activeIndexFull = 0;
  int resetImage = 0;

  final CarouselController _controller = CarouselController();
  Widget buildImage({final String? urlImage}) => CachedNetworkImage(
        imageUrl: urlImage!,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
      );
  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: const WormEffect(
          paintStyle: PaintingStyle.stroke,
          radius: BorderSide.strokeAlignOutside,
          activeDotColor: Colors.grey,
          dotHeight: 10,
          dotWidth: 10,
        ),
        activeIndex: activeIndex,
        count: widget.image.length,
      );

  Widget buildIndicatorFull() => AnimatedSmoothIndicator(
        effect: const WormEffect(
          paintStyle: PaintingStyle.stroke,
          radius: BorderSide.strokeAlignOutside,
          activeDotColor: Colors.grey,
          dotHeight: 10,
          dotWidth: 10,
        ),
        activeIndex: activeIndexFull,
        count: widget.image.length,
      );
  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<ColorCubit, int>(
      builder: (final context, final state) {
        if (context.read<ColorCubit>().state != resetImage) {
          resetImage = context.read<ColorCubit>().state;
          activeIndex = 0;
          unawaited(_controller.animateToPage(0));
        }
        return Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: widget.checkCategory
                      ? MediaQuery.of(context).size.height / 1.85
                      : MediaQuery.of(context).size.height / 1.55,
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider.builder(
                    carouselController: _controller,
                    itemCount: widget.image.length,
                    itemBuilder: (final _, final index, final realIndex) {
                      return buildImage(urlImage: widget.image[index].url);
                    },
                    options: CarouselOptions(
                      viewportFraction: 1.0,
                      enableInfiniteScroll: false,
                      height: double.infinity,
                      onPageChanged: (final index, final reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: GestureDetector(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (final context) {
                          return StatefulBuilder(
                            builder: (final context, final setState) {
                              return AnimatedBuilder(
                                animation: ModalRoute.of(context)!.animation!,
                                builder: (
                                  final BuildContext context,
                                  final Widget? child,
                                ) {
                                  return Transform.scale(
                                    scale: ModalRoute.of(context)!
                                        .animation!
                                        .value,
                                    child: Stack(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          child: CarouselSlider.builder(
                                            carouselController:
                                                CarouselController(),
                                            disableGesture: EditableText
                                                .debugDeterministicCursor,
                                            itemCount: widget.image.length,
                                            itemBuilder: (
                                              final _,
                                              final index,
                                              final realIndex,
                                            ) {
                                              return buildImage(
                                                urlImage:
                                                    widget.image[index].url,
                                              );
                                            },
                                            options: CarouselOptions(
                                              viewportFraction: 1.0,
                                              height: double.infinity,
                                              onPageChanged:
                                                  (final index, final reason) {
                                                setState(() {
                                                  activeIndexFull = index;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(Icons.close),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: buildIndicatorFull(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF93958e),
                      ),
                      child: Image.network(
                        'https://res.cloudinary.com/dc4nkguls/image/upload/v1709625758/OpenFashion/icons/fkeujdieaukkdbgtkvfh.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 13),
            //product_detail_layout
            if (widget.checkCategory)
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 110,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.image.length,
                  itemBuilder: (final context, final index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() async {
                          activeIndex = index;
                          _controller.animateToPage(activeIndex);
                        });
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            child: Stack(
                              children: [
                                Image.network(widget.image[index].url),
                                if (index == widget.image.length - 1)
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    top: 0,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.black.withOpacity(0.1),
                                    ),
                                  )
                                else
                                  Container(),
                                if (index == widget.image.length - 1)
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    child: Image.network(
                                      'https://res.cloudinary.com/dc4nkguls/image/upload/v1709738940/OpenFashion/icons/zvyle6o7vqw893st3phy.png',
                                    ),
                                  )
                                else
                                  Container(),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: activeIndex == index,
                            child: Align(
                              child: SizedBox(
                                height: 8,
                                width: 100,
                                child: Stack(
                                  children: [
                                    Align(
                                      child: Container(
                                        height: 2,
                                        color: MyColor.primaryColor,
                                      ),
                                    ),
                                    const Align(
                                      child: SizedBox(
                                        height: 8,
                                        width: 8,
                                        child: Rhombus(
                                          color: MyColor.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            else
              //product_detail
              SizedBox(
                height: 15,
                width: double.infinity,
                child: Center(
                  child: ListView.builder(
                    itemCount: widget.image.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (final context, final index) {
                      return Container(
                        margin: const EdgeInsets.all(2),
                        height: 10,
                        width: 10,
                        child: RhombusIndicator(
                          color: Colors.amber,
                          checkIndex: activeIndex == index ? true : false,
                        ),
                      );
                    },
                  ),
                ),
              ),

            const SizedBox(),
          ],
        );
      },
    );
  }
}
