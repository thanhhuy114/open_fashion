import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_fashion/presentation/category_screen/bloc/category_bloc.dart';
import 'package:open_fashion/presentation/category_screen/widgets/category_gridview_card.dart';
import 'package:open_fashion/presentation/category_screen/widgets/category_pagecontroller.dart';

class CategoryGridView extends StatefulWidget {
  const CategoryGridView({Key? key, required this.state}) : super(key: key);
  final bool state;
  @override
  _CategoryGridViewState createState() => _CategoryGridViewState();
}

class _CategoryGridViewState extends State<CategoryGridView> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var myHeight =
        MediaQuery.of(context).size.height * 10 * (!widget.state ? 0.81 : 0.21);

    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const CircularProgressIndicator();
        } else if (state is CategoryLoaded) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: myHeight,
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: (state.lstCat.length / 10).ceil(),
                    itemBuilder: (context, index) {
                      final startIndex = index * 10;
                      final endIndex = startIndex + 10;
                      final sublist = state.lstCat.sublist(
                          startIndex, endIndex.clamp(0, state.lstCat.length));

                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: widget.state ? 2 : 1,
                          childAspectRatio: 0.55,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 15,
                        ),
                        itemCount: sublist.length,
                        itemBuilder: (context, itemIndex) {
                          final categoryIndex = index * 10 + itemIndex;
                          if (categoryIndex < state.lstCat.length) {
                            return CategoryGridviewCard(
                              myCat: sublist[itemIndex],
                              status: widget.state,
                            );
                          } else {
                            return Container(); // Or any other widget to handle out of bounds case
                          }
                        },
                      );
                    },
                  ),
                ),
                PageControl(pageController: _pageController),
              ],
            ),
          );
        }
        return const Text("Somethins went wrong");
      },
    );
  }
}
