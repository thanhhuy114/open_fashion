import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/counter/counter_cubit.dart';
import '../cubit/total/total_cubit.dart';

class QuanlityUpDown extends StatelessWidget {
  const QuanlityUpDown({super.key, required this.price});
  final double price;
  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<TotalCubit, double>(
      builder: (final context, final state) {
        return BlocBuilder<CounterCubit, int>(
          builder: (final context, final state) {
            return Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: GestureDetector(
                    onTap: () {
                      context.read<CounterCubit>().decrement();
                      context.read<TotalCubit>().removeProduct(
                            price: price,
                            // check: false,
                            // quantity: context.read<CounterCubit>().state,
                          );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        border: Border.all(
                          color: const Color.fromARGB(255, 146, 146, 146),
                        ),
                      ),
                      height: 30,
                      width: 30,
                      child: const Center(
                        child: Icon(Icons.remove),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Text(
                    '${context.read<CounterCubit>().state}',
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: GestureDetector(
                    onTap: () {
                      context.read<CounterCubit>().increment();
                      context.read<TotalCubit>().addProduct(
                            price: price,
                            // check: true,
                          );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        border: Border.all(
                          color: const Color.fromARGB(255, 146, 146, 146),
                        ),
                      ),
                      height: 30,
                      width: 30,
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
