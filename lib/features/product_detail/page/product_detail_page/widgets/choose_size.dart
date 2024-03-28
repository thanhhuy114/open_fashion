import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product_detail_response_models.dart';
import '../cubit/pick_size/size_cubit.dart';

class ChooseSize extends StatefulWidget {
  const ChooseSize({
    super.key,
    required this.sizeModel,
    required this.titleSize,
  });
  final List<SizeModel> sizeModel;
  final String titleSize;
  @override
  State<ChooseSize> createState() => _ChooseSizeState();
}

class _ChooseSizeState extends State<ChooseSize> {
  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SizeCubit, int>(
      builder: (final context, final state) {
        return Expanded(
          child: Row(
            children: [
              Text(widget.titleSize),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 28,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.sizeModel.length,
                    itemBuilder: (final context, final index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: GestureDetector(
                          onTap: () => context
                              .read<SizeCubit>()
                              .onTap(selectedIndex: index),
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.read<SizeCubit>().state == index
                                  ? Colors.black
                                  : Colors.white,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            height: 28,
                            width: 28,
                            child: Center(
                              child: Text(
                                widget.sizeModel[index].size!,
                                style: TextStyle(
                                  color:
                                      context.read<SizeCubit>().state == index
                                          ? Colors.white
                                          : Colors.black,
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
