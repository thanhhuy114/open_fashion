import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/footer_response_model.dart';
import '../../blog_grid_page/bloc/bloc_grid_page_provider.dart';
import '../../contact_us_page/view/contact_us_screen.dart';
import '../../our_story_page/views/our_story.dart';
import '../bloc/footer_bloc.dart';

class HomePageFooter extends StatelessWidget {
  const HomePageFooter({super.key});
  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => FooterBloc()..add(LoadFooter()),
      child: BlocBuilder<FooterBloc, FooterState>(
        builder: (final context, final state) {
          if (state is FooterLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FooterError) {
            return Center(
              child: Text('Something went wrong! ${state.error}'),
            );
          }
          if (state is FooterLoaded) {
            final FooterModel? data = state.footer;
            return Container(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FaIcon(FontAwesomeIcons.twitter),
                      const SizedBox(
                        width: 35,
                      ),
                      SizedBox(
                        width: 32,
                        child: Image.asset('assets/icons/Instagram.jpg'),
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      const FaIcon(FontAwesomeIcons.youtube),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/img/3.png'),
                  Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        '${data!.gmail}'
                        '\n'
                        '${data.phone}'
                        '\n'
                        // ignore: lines_longer_than_80_chars
                        '${data.openTime} - ${data.closeTime} - ${data.daysPerWeek}',
                        style: GoogleFonts.tenorSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/img/3.png'),
                  Container(
                    margin: const EdgeInsets.only(left: 50, right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (final context) =>
                                    const OurStoryPage(),
                              ),
                            );
                          },
                          child: Text(
                            'About',
                            style: GoogleFonts.tenorSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (final context) =>
                                    const ContactUsScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Contact',
                            style: GoogleFonts.tenorSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (final context) =>
                                    const BlocGridPageProvider(),
                              ),
                            );
                          },
                          child: Text(
                            'Blog',
                            style: GoogleFonts.tenorSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 2 - 350,
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromRGBO(196, 196, 196, 1),
                    child: Text(
                      'Copyright© OpenUI All Rights Reserved.',
                      style: GoogleFonts.tenorSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
