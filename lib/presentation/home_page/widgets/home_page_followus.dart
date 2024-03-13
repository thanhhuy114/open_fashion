import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/menu_arrival_response_model.dart';

class HomePageFollowUs extends StatelessWidget {
  const HomePageFollowUs({super.key, required this.fu});
  final List<FollowUsModel> fu;
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
                image: fu[index].image,
                tag: fu[index].tag,
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
                        'https://s3-alpha-sig.figma.com/img/2bd1/ec31/c200fd437c1b6f07925da5405eb9d0ba?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=KyGKK9WS9yXcYsZEsWXX3ACnJk5VEIUIjhsAac9AY1LSOw0EQfB9ddaYsID0Aexsbys~46qOURhrpdtZozKUDtoxgartKOaVeb7tcy314QkH0WNt-NlkIQlifVBsxKVng-WUalaX21HyU6FZNiHyN1A1~zoxpy9pWhSxqzUEUuGD2GkFh68EIWSNrxCuByTMZqjVndkG7iFXjeobk~i~KfGfOjLCEOxn1-5uLyVDDXZO0Bmhz8BvnxVEF3p8Uh-esw4H4HHq4I7mP1a-zDgfl9usvJlnA4GMWIOZaWW4geaIaBkEit~y08gcjlqU~tBtOWAhuPEiE~FiiOy4CfBiKg__',
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
                        'https://s3-alpha-sig.figma.com/img/5e3c/e7f9/e6f7826825de8bc9ff46a1000bf54059?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=oI42yYtp9Gxymk3SEsvhtL0R0C9KmnWXPlU5GeVZOn-3y5Tmm5IT5E6KfVdZ7aMPbrygYS~3k1PAGuVNFBY-eTx5KnGMZIdUX4GL8QB6OblCJWIDxX7MgS3SxpNYCmDoScalsYE7ATkJoKnJ73iCDhI0LHs7sKUuUKvYWOm1K1NeOKe41~C-d~5nqGKtAfE3z8giDFKZzEhVIXRe~W1dy5kCsJm2A5DZ0bNnSCssPmO14HD3ms9neqLQ58h4HE0fWB0vPz6U8pRAEYE2UxDhedCp7zRccvAu0WCmu6F64ndjZywzQzwJVuztfO68EfKUTPKPK7XwTYZ7b4pxNqNGOw__',
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
                        'https://s3-alpha-sig.figma.com/img/0b1d/bf24/5c4edf2d122d8da0495729a6afc5025b?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=eBC1a4L0DipoxvVpvpdejPo2fjLlcTsqKZKUE-Az7THs7HiUtQCJOT46bgBErCssqq-4ccyRkwVDZPr40jMrRzzc94icFx1FDknwbJRyxcXDNYpsg1j5AEWCJAxIx-j6I3WmLYmQEqbXnLzmzkW024nI4DiSuPVqH6TRTmbD38sKTSxGSQqVCvDn8qQ7wCEKCRPjwBdwlBhjNMIRz9QuMbV9mLvbBqxq4XM~mxxiDDc0CSKr0MaRAWDtpUbtIxfqRHAu6JtXjG1ROtMJE4vnm3ydSc7gROqOC9~OP5v9UhHdUTgs6saWR5Pzc1ywAz7fBONxGoXm4JEk1dxZGwbH5Q__',
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
                        'https://s3-alpha-sig.figma.com/img/5d4b/7208/459554fe60b984c95e951ca8dbb2111b?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=R7y1VZFR7fB2xWTYArwvlsKRFcm1GhFhITDvCSBkPeiA2OdM~xmIOybqJ5lVpomaMvYN736pFlN5HRKUwsbfrM5eEydxrQP~NWwu4nhl5TpV7-cXplgmvVMIT4CYSkrZpw2GjJWm6qmnThZi7LzEg1~PlvT6IcO3bv~0MrVYrAHFPtr8tUyusMb-lAR4L1iKpVzUIE2KnY8J2TYogzt0Xe-dswgEhd3y5fs7Ppv39VhKGl8FdPFEcMTsxgmvOzz1SN6v~FTnmfsc-cCAhhE5XYtkAUt-xNgWqijmBUpfkoBpjqd6iSi3MnhbSJnSnbsn7At~vIQV9mPA52Bm5dYJOw__',
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
