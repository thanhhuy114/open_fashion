import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_fashion/models/product_detail_response_models.dart';
import 'package:open_fashion/presentation/product_detail_page/cubit/pick_favorie/favorite_cubit.dart';
import 'package:open_fashion/widgets/my_color.dart';

class ItemMaySoLike extends StatefulWidget {
  const ItemMaySoLike({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  State<ItemMaySoLike> createState() => _ItemMaySoLikeState();
}

class _ItemMaySoLikeState extends State<ItemMaySoLike> {
  bool? checkFavorite;
  @override
  void initState() {
    super.initState();
    checkFavorite = widget.categoryModel.isFavorite!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Positioned(
              child: Image.network(widget.categoryModel.image!),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: IconButton(
                  onPressed: () {
                    checkFavorite = !checkFavorite!;

                    context.read<FavoriteCubit>().onTap(onT: checkFavorite!);
                  },
                  icon: context.read<FavoriteCubit>().state
                      ? const Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.red,
                        )
                      : const Icon(Icons.favorite_border_rounded)),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(widget.categoryModel.name!),
            Text(
              widget.categoryModel.description!,
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              r'$' '${widget.categoryModel.price!.toStringAsFixed(0)}',
              style: const TextStyle(color: MyColor.primaryColor, fontSize: 18),
            ),
            const SizedBox(height: 20),
          ],
        )
      ],
    );
  }
}
