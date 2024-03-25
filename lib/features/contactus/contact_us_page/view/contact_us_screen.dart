import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection_container.dart';
import '../../../../widgets/appbar_custom_widget.dart';
import '../../../../widgets/menu_drawer_widget.dart';
import '../../../homepage/home_page/widgets/home_page_footer.dart';
import '../bloc/contact_us_bloc.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(final BuildContext context) {
    return BlocProvider<ContactUsBloc>(
      create: (final context) => sl()..add(GetContact()),
      child: BlocBuilder<ContactUsBloc, ContactUsState>(
        builder: (final context, final state) {
          if (state is ContactUsLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is ContactUsError) {
            return const Scaffold(
              body: Center(
                child: Text('Something went wrong!'),
              ),
            );
          }
          if (state is ContactUsLoaded) {
            return Scaffold(
              appBar: AppBarCustom(),
              drawer: MenuDrawer(),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                      child: Column(
                        children: [
                          const Text('CONTACT US'),
                          Image.asset('assets/img/3.png'),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/img/Chat Message.png'),
                          ),
                          Text(
                            state.contactus!.chat!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll<Color>(Colors.black),
                              shape:
                                  MaterialStatePropertyAll(LinearBorder.none),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'CHAT WITH US',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/img/Add Message.png'),
                          ),
                          Text(
                            state.contactus!.text!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll<Color>(Colors.black),
                              shape:
                                  MaterialStatePropertyAll(LinearBorder.none),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'TEXT US',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/img/Twitter-1.png'),
                          ),
                          Text.rich(
                            TextSpan(
                              text: '${state.contactus!.email!.facebook} ',
                              children: [
                                TextSpan(
                                  text: 'Facebook',
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                                TextSpan(text: ' ${state.contactus!.email!.twitter} '),
                                TextSpan(
                                  text: 'Twitter',
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                                TextSpan(text: ' ${state.contactus!.email!.end}'),
                              ],
                            ),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const HomePageFooter(),
                  ],
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
