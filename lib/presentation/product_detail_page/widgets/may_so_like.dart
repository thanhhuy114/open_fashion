import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/product_detail_response_models.dart';
import '../cubit/pick_favorie/favorite_cubit.dart';
import 'item_may_so_like.dart';

class MaySoLike extends StatelessWidget {
  const MaySoLike({super.key, required this.category});
  final List<CategoryModel> category;
  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          const Text(
            'You may also like',
            style: TextStyle(fontSize: 25, letterSpacing: 4, height: 2),
          ),
          Image.network(
            'https://res.cloudinary.com/dc4nkguls/image/upload/v1709690662/OpenFashion/icons/axqnsoyu2iex6rlyrhd1.png',
          ),
          const SizedBox(height: 20),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: ((category.length) / 2).ceil(),
            itemBuilder: (final context, final index) {
              final int actualIndex = index * 2;
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: BlocBuilder<FavoriteCubit, bool>(
                          builder: (final context, final state) {
                            return ItemMaySoLike(
                              categoryModel: category[actualIndex],
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: actualIndex + 1 < category.length
                            ? BlocBuilder<FavoriteCubit, bool>(
                                builder: (final context, final state) {
                                  return ItemMaySoLike(
                                    categoryModel: category[actualIndex + 1],
                                  );
                                },
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
