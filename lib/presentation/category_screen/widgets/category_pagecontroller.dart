import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_fashion/presentation/category_screen/bloc/category_bloc.dart';

class PageControl extends StatelessWidget {
  final PageController pageController;

  const PageControl({Key? key, required this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return Container();
          } else if (state is CategoryLoaded) {
            return AnimatedBuilder(
              animation: pageController,
              builder: (context, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int index = 0;
                        index < (state.lstCat.length / 10).ceil();
                        index++)
                      GestureDetector(
                        onTap: () {
                          pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.ease,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            color: pageController.page == index
                                ? Colors.black
                                : const Color.fromRGBO(136, 136, 136, 0.5),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                              color: pageController.page == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    IconButton(
                      onPressed: () {
                        if (pageController.page != null &&
                            pageController.page! <
                                (state.lstCat.length / 10).ceil() - 1) {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.ease,
                          );
                        }
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: pageController.page != null &&
                                pageController.page! <
                                    (state.lstCat.length / 10).ceil() - 1
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
