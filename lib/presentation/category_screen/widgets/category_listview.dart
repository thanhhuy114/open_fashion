import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_fashion/presentation/category_screen/bloc/category_bloc.dart';
import 'package:open_fashion/presentation/category_screen/widgets/category_listview_card.dart';
import 'package:open_fashion/presentation/category_screen/widgets/category_pagecontroller.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const CircularProgressIndicator();
        } else if (state is CategoryLoaded) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 10 * 0.21,
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

                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: sublist.length,
                        itemBuilder: (context, itemIndex) {
                          return CategoryListViewCard(
                            mycat: sublist[itemIndex],
                          );
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
        return const Text("Something went wrong");
      },
    );
  }
}
