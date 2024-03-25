import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../feature/collection/presentation/collection_page/views/collection_screen.dart';
import '../../../../injection_container.dart';
import '../../../../widgets/appbar_custom_widget.dart';
import '../../../../widgets/menu_drawer_widget.dart';
import '../bloc/home_page_arrival_bloc.dart';
import '../bloc/home_page_followus_bloc.dart';
import '../bloc/home_page_justforyou_bloc.dart';
import '../widgets/Home_page_trending.dart';
import '../widgets/home_page_brand.dart';
import '../widgets/home_page_collection.dart';
import '../widgets/home_page_followus.dart';
import '../widgets/home_page_footer.dart';
import '../widgets/home_page_justforyou.dart';
import '../widgets/home_page_newArrival.dart';
import '../widgets/home_page_openfashion.dart';
import '../widgets/home_page_stack.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  /* List<ArrivalModel> menu = [];
  List<JustForYouModel> jfu = [];
  List<FollowUsModel> fu = []; */
  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomePageArrivalBloc>(
          create: (final context) => sl()..add(GetArrivals()),
        ),
        BlocProvider<HomePageJustforyouBloc>(
          create: (final context) => sl()..add(const GetJustforyou()),
        ),
        BlocProvider<HomePageFollowusBloc>(
          create: (final context) => sl()..add(GetFollowus()),
        ),
      ],
      child: BlocBuilder<HomePageArrivalBloc, HomePageArrivalState>(
        builder: (final context, final state) {
          if (state is HomePageArrivalLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is HomePageArrivalError) {
            return Scaffold(
              body: Center(
                child: Text('Something went wrong! //${state.error}'),
              ),
            );
          }
          if (state is HomePageArrivalLoaded) {
            /* menu = state.menuArrival;
            jfu = state.jfu;
            fu = state.fu; */
            return Scaffold(
              appBar: AppBarCustom(),
              drawer: MenuDrawer(),
              body: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (final context) =>
                                    const CollectionScreen(),
                              ),
                            );
                          });
                        },
                        child: const HomePageStack(),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      HomePageNewArrival(
                        menu: state.arrival,
                      ),
                      const HomePageBrand(),
                      const SizedBox(
                        height: 35,
                      ),
                      const HomePageCollection(),
                      const SizedBox(
                        height: 35,
                      ),
                      BlocBuilder<HomePageJustforyouBloc,
                          HomePageJustforyouState>(
                        builder: (final context, final state) {
                          if (state is HomePageJFULoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is HomePageJFUError) {
                            return const Center(
                              child: Text('Something went wrong'),
                            );
                          }
                          if (state is HomePageJFULoaded) {
                            return HomePageJustForYou(
                              jfu: state.justforyou!,
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      const HomePageTrending(),
                      const SizedBox(
                        height: 20,
                      ),
                      const HomePageOpenFashion(),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<HomePageFollowusBloc, HomePageFollowusState>(
                        builder: (final context, final state) {
                          if (state is HomePageFollowusLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is HomePageArrivalError) {
                            return const Center(
                              child: Text('Something went wrong!'),
                            );
                          }
                          if (state is HomePageArrivalLoaded) {
                            return HomePageFollowUs(
                              fu: state.fu!,
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                      const HomePageFooter(),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
