import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/bloc_grid_page.dart';
import 'post_menu/post_menu_bloc.dart';
import 'post_menu/post_menu_event.dart';

class BlocGridPageProvider extends StatelessWidget {
  const BlocGridPageProvider({super.key});

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (final context) =>
              PostMenuBloc()..add(PostMenuEventStarted()),
        ),
      ],
      child: const BlogGirdPage(),
    );
  }
}
