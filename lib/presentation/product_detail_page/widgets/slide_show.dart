import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:open_fashion/models/product_detail_response_models.dart';
import 'package:open_fashion/widgets/my_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SlideShowProductDetail extends StatefulWidget {
  const SlideShowProductDetail(
      {super.key, required this.image, required this.checkCategory});
  final List<ImageModel> image;
  final bool checkCategory;
  @override
  State<SlideShowProductDetail> createState() => _SlideShowProductDetailState();
}

class _SlideShowProductDetailState extends State<SlideShowProductDetail> {
  int activeIndex = 0;

  final CarouselController _controller = CarouselController();
  Widget buildImage({String? urlImage}) => CachedNetworkImage(
      imageUrl: urlImage!,
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width);
  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: const WormEffect(
            paintStyle: PaintingStyle.stroke,
            radius: BorderSide.strokeAlignOutside,
            type: WormType.thinUnderground,
            activeDotColor: Colors.grey,
            dotHeight: 10,
            dotWidth: 10,
            dotColor: Colors.grey),
        activeIndex: activeIndex,
        count: widget.image.length,
      );
  @override
  Widget build(BuildContext context) {
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
                itemBuilder: (_, index, realIndex) {
                  return buildImage(urlImage: widget.image[index].url);
                },
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  height: double.infinity,
                  onPageChanged: (index, reason) {
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
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AnimatedBuilder(
                            animation: ModalRoute.of(context)!.animation!,
                            builder: (BuildContext context, Widget? child) {
                              return Transform.scale(
                                scale: ModalRoute.of(context)!.animation!.value,
                                child: Stack(children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: CarouselSlider.builder(
                                      carouselController: CarouselController(),
                                      disableGesture:
                                          EditableText.debugDeterministicCursor,
                                      itemCount: widget.image.length,
                                      itemBuilder: (_, index, realIndex) {
                                        return buildImage(
                                            urlImage: widget.image[index].url);
                                      },
                                      options: CarouselOptions(
                                        viewportFraction: 1.0,
                                        height: double.infinity,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            activeIndex = index;
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
                                      ))
                                ]),
                              );
                            });
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
                        'https://res.cloudinary.com/dc4nkguls/image/upload/v1709625758/OpenFashion/icons/fkeujdieaukkdbgtkvfh.png'),
                  ),
                ))
          ],
        ),
        const SizedBox(height: 13),
        widget.checkCategory ? const SizedBox() : buildIndicator(),
        widget.checkCategory
            ? SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 110,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.image.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
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
                                Image.network(widget.image[index].url!),
                                index == widget.image.length - 1
                                    ? Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        top: 0,
                                        child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: Colors.black.withOpacity(0.1),
                                        ))
                                    : Container(),
                                index == widget.image.length - 1
                                    ? Positioned(
                                        top: 0,
                                        bottom: 0,
                                        child: Image.network(
                                            'https://res.cloudinary.com/dc4nkguls/image/upload/v1709738940/OpenFashion/icons/zvyle6o7vqw893st3phy.png'),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                          Visibility(
                            visible: activeIndex == index,
                            child: Align(
                              child: SizedBox(
                                height: 4,
                                width: 100,
                                child: Stack(
                                  children: [
                                    Align(
                                      child: Container(
                                        height: 2,
                                        color: MyColor.primaryColor,
                                      ),
                                    ),
                                    Align(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: MyColor.primaryColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        height: 6,
                                        width: 6,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ))
            : const SizedBox(),
      ],
    );
  }
}
