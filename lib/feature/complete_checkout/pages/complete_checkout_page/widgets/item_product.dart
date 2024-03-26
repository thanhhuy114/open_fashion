import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../widgets/my_color.dart';
import '../../../data/models/checkout_response_model.dart';
import '../cubit/counter/counter_cubit.dart';
import 'quanlity.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({super.key, required this.productItem});
  final ProductItem productItem;
  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Image.network(
            productItem.image.url!,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productItem.name!.toUpperCase(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 3),
              Text(productItem.description!),
              const SizedBox(height: 8),
              BlocProvider(
                create: (final context) => CounterCubit(),
                child: QuanlityUpDown(price: productItem.price!),
              ),
              const SizedBox(height: 10),
              Text(
                r'$' '${productItem.price!.toInt()}',
                style: const TextStyle(
                  color: MyColor.primaryColor,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
