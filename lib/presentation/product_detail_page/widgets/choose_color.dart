import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_fashion/models/product_detail_response_models.dart';
import 'package:open_fashion/presentation/product_detail_page/cubit/pick_color/color_cubit.dart';
import 'package:open_fashion/widgets/my_color.dart';

class ChooseColor extends StatefulWidget {
  const ChooseColor({super.key, required this.productDetailModel});
  final ProductDetailModel productDetailModel;
  @override
  State<ChooseColor> createState() => _ChooseColorState();
}

class _ChooseColorState extends State<ChooseColor> {
  Color getColor(int id) {
    if (id == 1) {
      return Colors.black;
    } else if (id == 2) {
      return MyColor.primaryColor;
    } else {
      return MyColor.secondColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorCubit, int>(
      builder: (context, state) {
        return Expanded(
          child: Row(
            children: [
              const Text('Color'),
              const SizedBox(width: 10),
              Expanded(
                flex: 5,
                child: SizedBox(
                  height: 24,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.productDetailModel.color!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: GestureDetector(
                          onTap: () => context
                              .read<ColorCubit>()
                              .onTap(selectedIndex: index),
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    context.read<ColorCubit>().state == index
                                        ? Border.all(color: Colors.grey)
                                        : Border.all(color: Colors.white)),
                            child: ClipOval(
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(50),
                                  color: getColor(widget
                                      .productDetailModel.color![index].id!),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
