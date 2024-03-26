import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../locator.dart';
import '../../../../../widgets/appbar_custom_widget.dart';
import '../../../../../widgets/menu_drawer_widget.dart';
import '../../../../complete_checkout/pages/complete_checkout_page/widgets/button_custom.dart';
import '../bloc/remote/remote_our_story_bloc_bloc.dart';

class OurStoryPage extends StatelessWidget {
  OurStoryPage({super.key});
  final RemoteOurStoryBloc _remoteOurStoryBloc = RemoteOurStoryBloc(sl());
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarCustom(),
      drawer: MenuDrawer(),
      body: BlocProvider<RemoteOurStoryBloc>(
        create: (final context) =>
            _remoteOurStoryBloc..add(const GetOurStory()),
        child: BlocBuilder<RemoteOurStoryBloc, RemoteOurStoryBlocState>(
          builder: (final context, final state) {
            switch (state) {
              case RemoteOurStoryBlocLoading():
                return const Center(child: CircularProgressIndicator());
              case RemoteOurStoryBlocDone():
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 14),
                          const Text(
                            'OUR STORY',
                            style: TextStyle(fontSize: 20, letterSpacing: 4),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 145,
                            ),
                            child: Image.asset(
                              'assets/images/3.png',
                              height: 10,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Text(
                              state.ourStory!.openMessage!,
                              style: const TextStyle(fontSize: 16.5),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              state.ourStory!.createMessage!,
                              style: const TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      Image.network(
                        state.ourStory!.images!.url!,
                      ),
                      const SizedBox(height: 18),
                      Column(
                        children: [
                          const Text(
                            'SIGN UP',
                            style: TextStyle(fontSize: 20, letterSpacing: 4),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 145,
                            ),
                            child: Image.asset(
                              'assets/images/3.png',
                              height: 10,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Align(
                              child: Text(
                                state.ourStory!.signUp!,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Email address',
                            hintStyle: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 75,
                      ),
                    ],
                  ),
                );
              default:
                return Container();
            }
          },
        ),
      ),
      bottomSheet: ButtonCustom(
        message: 'SUBMIT',
        onTap: () {},
        icon: const Icon(
          Icons.arrow_forward_rounded,
          color: Colors.white,
        ),
        checkLR: false,
      ),
    );
  }
}
