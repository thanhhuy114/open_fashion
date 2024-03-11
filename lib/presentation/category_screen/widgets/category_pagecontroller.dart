import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/category_bloc.dart';

class PageControl extends StatefulWidget {
  const PageControl({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<PageControl> createState() => _PageControlState();
}

class _PageControlState extends State<PageControl> {
  int currentPage = 0; // Thêm trạng thái cho trang hiện tại

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (final context, final state) {
          if (state is CategoryLoading) {
            return Container();
          } else if (state is CategoryLoaded) {
            return AnimatedBuilder(
              animation: widget.pageController,
              builder: (final context, final child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: (state.lstCat.length / 10).ceil(),
                        itemBuilder: (final context, final index) =>
                            GestureDetector(
                          onTap: () async {
                            setState(() {
                              currentPage = index; // Cập nhật trang hiện tại
                            });
                            widget.pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              color: currentPage == index
                                  ? Colors.black
                                  : const Color.fromRGBO(136, 136, 136, 0.5),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                color: currentPage == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (currentPage <
                            (state.lstCat.length / 10).ceil() - 1) {
                          setState(() {
                            currentPage++; // Cập nhật trang hiện tại
                          });
                          widget.pageController.nextPage(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.ease,
                          );
                        }
                      },
                      child: Icon(
                        Icons.arrow_forward,
                        color:
                            currentPage < (state.lstCat.length / 10).ceil() - 1
                                ? Colors.black
                                : Colors.transparent,
                      ),
                    ),
                  ],
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
