import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/menu_arrival_response_model.dart';
import '../bloc/footer_bloc.dart';
import '../bloc/home_page_bloc.dart';
import '../widgets/Home_page_trending.dart';
import '../widgets/app_bar.dart';
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
  List<ArrivalModel> menu = [];
  List<JustForYouModel> jfu = [];
  List<FollowUsModel> fu = [];
  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (final context) => HomePageBloc()..add(LoadHomePage()),
        ),
        BlocProvider(
          create: (final context) => FooterBloc()..add(LoadFooter()),
        ),
      ],
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (final context, final state) {
          if (state is HomePageInitial) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is HomePageError) {
            return Scaffold(
              body: Center(
                child: Text('Something went wrong! //${state.error}'),
              ),
            );
          }
          if (state is HomePageLoaded) {
            menu = state.menuArrival;
            jfu = state.jfu;
            fu = state.fu;
            return Scaffold(
              appBar: const PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: AppBarWidget(),
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                ),
              ),
              body: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: const HomePageStack(),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      HomePageNewArrival(
                        menu: menu,
                      ),
                      const HomePageBrand(),
                      const SizedBox(
                        height: 35,
                      ),
                      const HomePageCollection(),
                      const SizedBox(
                        height: 35,
                      ),
                      HomePageJustForYou(
                        jfu: jfu,
                      ),
                      const HomePageTrending(),
                      const SizedBox(
                        height: 20,
                      ),
                      const HomePageOpenFashion(),
                      const SizedBox(
                        height: 20,
                      ),
                      HomePageFollowUs(
                        fu: fu,
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
