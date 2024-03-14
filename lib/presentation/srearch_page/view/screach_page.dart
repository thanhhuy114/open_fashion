import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/recent_search/recent_bloc.dart';
import '../bloc/recent_search/recent_event.dart';
import '../bloc/recent_search/recent_state.dart';
import '../widgets/button_recent_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            CustomTextField(
              textTheme: textTheme,
              controller: controller,
            ),
            const Divider(
              color: Colors.black,
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<RecentSearchBloc, RecentSearchState>(
                      builder: (final context, final state) {
                        switch (state) {
                          case RecentSearchStateSucces _:
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    'Recent search',
                                    style: textTheme.labelMedium!.copyWith(
                                      color: const Color(0xFF888888),
                                    ),
                                  ),
                                ),
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 7,
                                  children: List.generate(
                                    state.recentSearchs.length,
                                    (final index) => ButtonRecentSearch(
                                      text: state.recentSearchs[index],
                                      onRemove: () {
                                        context.read<RecentSearchBloc>().add(
                                              RecenSearchEventDelete(
                                                recenSearchs:
                                                    state.recentSearchs,
                                                item:
                                                    state.recentSearchs[index],
                                              ),
                                            );
                                      },
                                      onTap: () {
                                        controller.text =
                                            state.recentSearchs[index];
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          case RecentSearchStateLoading _:
                          case RecentSearchStateFailure _:
                          default:
                            return Container();
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Popular search terms',
                        style: textTheme.labelMedium!
                            .copyWith(color: const Color(0xFF888888)),
                      ),
                    ),
                    ...List.generate(
                      10,
                      (final index) => const Padding(
                        padding: EdgeInsets.only(bottom: 7),
                        child: Text(
                          'Trend',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textTheme,
    required this.controller,
  });

  final TextTheme textTheme;
  final TextEditingController controller;

  @override
  Widget build(final BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: controller,
      style: textTheme.labelMedium!.copyWith(
        color: const Color(0xFF555555),
      ),
      cursorColor: const Color(0xFF555555),
      decoration: InputDecoration(
        hintText: 'Search items',
        hintStyle: textTheme.labelMedium!.copyWith(
          color: const Color(0xFF555555),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            controller.clear();
          },
        ),
        icon: Image.asset(
          'assets/images/search.png',
          fit: BoxFit.cover,
          height: 24,
          width: 24,
        ),
        border: InputBorder.none,
      ),
    );
  }
}
