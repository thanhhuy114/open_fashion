import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/contact_us_response_model.dart';
import '../../../widgets/appbar_custom_widget.dart';
import '../../../widgets/menu_drawer_widget.dart';
import '../../home_page/widgets/home_page_footer.dart';
import '../bloc/contact_us_bloc.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => ContactUsBloc()..add(LoadContactUs()),
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
            final ContactUsModel data = state.contactus;
            return Scaffold(
              appBar: AppBarCustom(),
              drawer:  MenuDrawer(),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                      child: Column(
                        children: [
                          const Text('CONTACT US'),
                          Image.asset('assets/img/3.png'),
                          const SizedBox(height: 30,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/img/Chat Message.png'),
                          ),
                          Text(data.chat, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
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
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                          ),
                          const SizedBox(height: 30,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/img/Add Message.png'),
                          ),
                          Text(data.text, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
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
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                          ),
                          const SizedBox(height: 30,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/img/Twitter-1.png'),
                          ),
                          Text.rich(
                            TextSpan(
                              text: '${data.email.facebook} ',
                              children: [
                                TextSpan(
                                  text: 'Facebook',
                                  style: const TextStyle(
                                      decoration: TextDecoration.underline,),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                                TextSpan(text: ' ${data.email.twitter} '),
                                TextSpan(
                                  text: 'Twitter',
                                  style: const TextStyle(
                                      decoration: TextDecoration.underline,),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                                TextSpan(text: ' ${data.email.end}'),
                              ],
                            ),style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
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
