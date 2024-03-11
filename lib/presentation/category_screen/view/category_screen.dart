import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/category_status_filer_manager.dart';
import '../../../widgets/appbar_custom_widget.dart';
import '../bloc/category_bloc.dart';
import '../widgets/category_bottom.dart';
import '../widgets/category_filter.dart';
import '../widgets/category_gridview.dart';
import '../widgets/category_listview.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc()..add(const CategoryLoadEvent()),
        ),
      ],
      child: Scaffold(
        appBar: const AppBarCustom(),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Column(
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
          ],
        ),
      ),
    );
  }
}
