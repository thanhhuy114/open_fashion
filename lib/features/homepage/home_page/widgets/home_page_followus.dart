import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/arrival.dart';

class HomePageFollowUs extends StatelessWidget {
  const HomePageFollowUs({super.key, required this.fu});
  final List<FollowUsEntity> fu;
  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Text(
          'FOLLOW US',
          style: GoogleFonts.tenorSans(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            letterSpacing: 4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/img/Instagram.png'),
        ),
        /* SizedBox(
          width: MediaQuery.of(context).size.width-10,
          height: 450,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: fu.length,
            itemBuilder: (final context, final index) {
              return ItemFollowUs(
                image: fu[index].image!,
                tag: fu[index].tag!,
              );
            },
          ),
        ), */
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.8,
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.saturation,
                      ),
                      child: Image.network(
                        fit: BoxFit.cover,
                        width: 164,
                        'https://s3-alpha-sig.figma.com/img/2bd1/ec31/c200fd437c1b6f07925da5405eb9d0ba?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=N~qOWDhu6AkqY2lAuGSzAxRmjYIqsWd~D~d~6J-65M0h3niDovHEBQHIctF~b1wA5Oe2NCosy-VBsCACmiXPN~KR2WBw0aCS~yj~zMzZVg-zEAvSpPeKcfQk3ZjTyDJYZj2-3g~ycTIw~XjoIt8d1ALOQ~x76MPIcm7VCKdqjC9ZSn-QdzG6XN8hzmpIu3XlSMktG72ytGi9-ZU7wUg5rerKIRWiSH6MSm3a6g4BF5LrIUY-EaQxgT-qX3ti2LjMHhybXcvzwjsP~UVDYmdZ6hh0D4CuS7kU889xXlHb422KpuWWisV8L9khIE7WvyhDBQM7GWRQaDFXWL7irDOaoA__',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.5,
                          ),
                          blurRadius: 5,
                          spreadRadius: 5,
                          offset: const Offset(
                            0,
                            5,
                          ),
                        ),
                      ],
                    ),
                    child: Text(
                      '@mia',
                      style: GoogleFonts.tenorSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.36,
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.saturation,
                      ),
                      child: Image.network(
                        fit: BoxFit.cover,
                        width: 164,
                        height: 500,
                        'https://s3-alpha-sig.figma.com/img/5e3c/e7f9/e6f7826825de8bc9ff46a1000bf54059?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OfHjDRkvk44VzE28HsEUzzymkZytGAz0FexHgMe9aPnLzyW~vlDzHF9wpAem1akwiXQLr~moxBhqwaUxvSd8cvkcVDELJuz2Dj4xZW4N5ZDOdG3Kc667sRZ5cBb6baU0tKtk~Y2cNWGbtuj7TBcEgYPfJfwvQg~Et1ZLyIb5P17tmWzF4L5sJSpM7q9HGEWTuWO6vWV7VkT1DnmDaaWmFukdX34reVxGGCBYkif7zpsvcY1GdPdgc-2PPoSNSi9jb0TQdRltuQQJz9ByRW5cpQ2iLMOH97WMdzPf9AOvyunxQ68zQ~E98Vwqz5vFIlqLhTZaNMN7~cxNFcZa7bTDuw__',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.5,
                          ),
                          blurRadius: 5,
                          spreadRadius: 5,
                          offset: const Offset(
                            0,
                            5,
                          ),
                        ),
                      ],
                    ),
                    child: Text(
                      '@_jihyn',
                      style: GoogleFonts.tenorSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.8,
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.saturation,
                      ),
                      child: Image.network(
                        fit: BoxFit.cover,
                        width: 164,
                        'https://s3-alpha-sig.figma.com/img/0b1d/bf24/5c4edf2d122d8da0495729a6afc5025b?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LFn-1g1blUF2Oci5SvDazCC~I2il4tPGWDIHKZvKI2Z~7Ehv2jKYgvybDyr1ZTmaExLMxW13EJmNBqwnoVsWEqdX69hpK5v0e8ZgBpTQHleVBm4owYOpgOgFmrJ-wq9lj7CJc6VxmYqFYvW8YA8BJBCKx0VENjLk-Oax0Q-Ohp5zBy54-uIW87oz-8nSX47QOwjx8IR8UeP8k4z~147GSPbLS8tUobVxXpuOLChhW-tiK6jNRKbBSOZDs36ETlBkYjdL4RWUwVpwF-eUmEt-rN-BJ5YY7hoQtSlpCdtkstP2Bs0ltujKak5pn29DpNTy~mFek-kf7YV~~yOuAieaWA__',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.5,
                          ),
                          blurRadius: 5,
                          spreadRadius: 5,
                          offset: const Offset(
                            0,
                            5,
                          ),
                        ),
                      ],
                    ),
                    child: Text(
                      '@mia',
                      style: GoogleFonts.tenorSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.45,
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.saturation,
                      ),
                      child: Image.network(
                        fit: BoxFit.cover,
                        width: 164,
                        height: 380,
                        'https://s3-alpha-sig.figma.com/img/5d4b/7208/459554fe60b984c95e951ca8dbb2111b?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=I7o946CgWQQmcWHFuTGI7mtaNnXLMTJrwzZk8BlcPqnAlfn5HdahUi9KR8pL9SGLGH-3deXd6gAMSS~dUZlB1vrXcrfvDLNGq0507HM7G6CVjjS10CSeubnORbWnwXjA1FPgYOaqIuT7p--qP4qpZcIPu8vQRuGH54N-IVDB9-TZ1wc1Q-5bgXToiaLLxsNJ5dvX8sZBJa5FUE63OpOpNBO~px6e6p-04y1258E8ZECds34qg2orax9Nkd6cmVKC~OoPqq91dC8Mn6pQcYPhqCqM3f7FAnCCyozir5ZukMpJMvajV-hbuRRq3DL4cDMBQ136DbgxXVxPTrRT6bNtCQ__',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.5,
                          ),
                          blurRadius: 5,
                          spreadRadius: 5,
                          offset: const Offset(
                            0,
                            5,
                          ),
                        ),
                      ],
                    ),
                    child: Text(
                      '@_jihyn',
                      style: GoogleFonts.tenorSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ItemFollowUs extends StatelessWidget {
  const ItemFollowUs(
      {super.key,
      required this.image,
      required this.tag,});
  final String image;
  final String tag;
  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: [
        ClipRect(
          child: Align(
            alignment: Alignment.topLeft,
            heightFactor: 0.9,
            child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.saturation,
              ),
              child: Image.network(
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 500,
                image,
              ),
            ),
          ),
        ),
        Positioned(
          top: 150,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(
                    0.5,
                  ),
                  blurRadius: 5,
                  spreadRadius: 5,
                  offset: const Offset(
                    0,
                    5,
                  ),
                ),
              ],
            ),
            child: Text(
              tag,
              style: GoogleFonts.tenorSans(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                letterSpacing: 1,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
