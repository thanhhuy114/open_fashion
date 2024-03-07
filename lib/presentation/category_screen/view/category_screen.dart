import 'package:flutter/material.dart';
import 'package:open_fashion/presentation/category_screen/model/category_status_filer_manager.dart';
import 'package:open_fashion/presentation/category_screen/widgets/category_bottom.dart';
import 'package:open_fashion/presentation/category_screen/widgets/category_filter.dart';
import 'package:open_fashion/presentation/category_screen/widgets/category_gridview.dart';
import 'package:open_fashion/presentation/category_screen/widgets/category_listview.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cate Screen')),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: CategoryFilter(),
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: CategoryStatusFilterManager.status,
                    builder: (context, value, child) {
                      if (value == 3) {
                        return const CategoryGridView(
                          state: true,
                        );
                      } else if (value == 1) {
                        return const CategoryList();
                      } else {
                        return const CategoryGridView(
                          state: false,
                        );
                      }
                    },
                  ),
                  const Bottom()
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
