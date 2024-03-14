import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/category_bloc.dart';
import 'category_listview_card.dart';
import 'category_pagecontroller.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  CategoryListState createState() => CategoryListState();
}

class CategoryListState extends State<CategoryList> {
  final PageController _pageController = PageController();

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (final context, final state) {
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
                    itemBuilder: (final context, final index) {
                      final startIndex = index * 10;
                      final endIndex = startIndex + 10;
                      final sublist = state.lstCat.sublist(
                        startIndex,
                        endIndex.clamp(0, state.lstCat.length),
                      );

                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: sublist.length,
                        itemBuilder: (final context, final itemIndex) {
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
        return const Text('Something went wrong');
      },
    );
  }
}
