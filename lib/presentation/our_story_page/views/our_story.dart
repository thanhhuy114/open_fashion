import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/appbar_custom_widget.dart';
import '../../complete_checkout_page/widgets/button_custom.dart';
import '../bloc/our_story_bloc.dart';

class OurStoryPage extends StatelessWidget {
  const OurStoryPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarCustom(),
      body: BlocProvider(
        create: (final context) => OurStoryBloc()..add(OurStoryLoadedEvent()),
        child: BlocBuilder<OurStoryBloc, OurStoryState>(
          builder: (final context, final state) {
            switch (state) {
              case OurStoryLoadingState():
                return const Center(child: CircularProgressIndicator());
              case OurStoryLoadedState():
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 14),
                          const Text(
                            'CHECKOUT',
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
                              state.ourStoryModel!.ourStory!.openMessage!,
                              style: const TextStyle(fontSize: 16.5),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              state.ourStoryModel!.ourStory!.createMessage!,
                              style: const TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      Image.network(
                        state.ourStoryModel!.ourStory!.images!.url!,
                      ),
                      const SizedBox(height: 18),
                      Column(
                        children: [
                          const Text(
                            'SIGN UP',
                            style: TextStyle(fontSize: 20, letterSpacing: 4),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Text(state.ourStoryModel!.ourStory!.signUp!),
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
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Email address',
                            hintStyle: TextStyle(fontSize: 15),
                          ),
                        ),
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
