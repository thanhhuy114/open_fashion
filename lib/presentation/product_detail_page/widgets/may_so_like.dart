import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_fashion/models/product_detail_response_models.dart';
import 'package:open_fashion/presentation/product_detail_page/cubit/pick_favorie/favorite_cubit.dart';
import 'package:open_fashion/presentation/product_detail_page/widgets/item_may_so_like.dart';

class MaySoLike extends StatelessWidget {
  const MaySoLike({super.key, required this.category});
  final List<CategoryModel> category;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      height: 800,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const Text(
            'You may also like',
            style: TextStyle(fontSize: 25, letterSpacing: 4, height: 2),
          ),
          Image.network(
              'https://res.cloudinary.com/dc4nkguls/image/upload/v1709690662/OpenFashion/icons/axqnsoyu2iex6rlyrhd1.png'),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ((category.length) / 2).ceil(),
              itemBuilder: (context, index) {
                int actualIndex = index * 2;
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: BlocBuilder<FavoriteCubit, bool>(
                            builder: (context, state) {
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
                                  builder: (context, state) {
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
          ),
        ],
      ),
    );
  }
}
