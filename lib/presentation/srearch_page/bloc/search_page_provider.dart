import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/screach_page.dart';
import 'recent_search/recent_bloc.dart';
import 'recent_search/recent_event.dart';

class SearchPageProvider extends StatelessWidget {
  const SearchPageProvider({super.key});

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (final context) =>
              RecentSearchBloc()..add(RecentSearchEventLoad()),
        ),
      ],
      child: const SearchPage(),
    );
  }
}

class RecentSearchEventStarted {}
