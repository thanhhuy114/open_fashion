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
  final ScrollController _gridController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var myHeight = MediaQuery.of(context).size.height *
        10 *
        (!widget.state ? 0.81 : 0.225);

    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (final context, final state) {
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
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    itemCount: (state.lstCat.length / 10).ceil(),
                    itemBuilder: (final context, final index) {
                      final startIndex = index * 10;
                      final endIndex = startIndex + 10;
                      final sublist = state.lstCat.sublist(
                          startIndex, endIndex.clamp(0, state.lstCat.length));

                      return GridView.builder(
                        padding: const EdgeInsets.all(15),
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _gridController,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: widget.state ? 2 : 1,
                          childAspectRatio: 0.5,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: sublist.length,
                        itemBuilder: (final context, final itemIndex) {
                          final categoryIndex = index * 10 + itemIndex;
                          if (categoryIndex < state.lstCat.length) {
                            return CategoryGridviewCard(
                              myCat: sublist[itemIndex],
                              status: widget.state,
                            );
                          } else {
                            return Container();
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
        } else if (state is CategoryNull) {
          return const Text('API ISSUE');
        }
        return const Text("Somethins went wrong");
      },
    );
  }
}
