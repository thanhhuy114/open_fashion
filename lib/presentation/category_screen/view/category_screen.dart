import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/appbar_custom_widget.dart';
import '../../home_page/widgets/home_page_footer.dart';
import '../widgets/category_filter.dart';
import '../widgets/category_gridview.dart';
import '../widgets/category_listview.dart';

import '../../../models/category_status_filer_manager.dart';
import '../bloc/category_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (final context) =>
              CategoryBloc()..add(const CategoryLoadEvent()),
        ),
      ],
      child: Scaffold(
        appBar: AppBarCustom(),
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
                      builder: (final context, final value, final child) {
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
                    const HomePageFooter(),
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
      ),
    );
  }
}
