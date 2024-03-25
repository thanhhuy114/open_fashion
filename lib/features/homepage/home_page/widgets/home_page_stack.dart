import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageStack extends StatefulWidget {
  const HomePageStack({super.key});

  @override
  State<HomePageStack> createState() => _HomePageStackState();
}

class _HomePageStackState extends State<HomePageStack> {
  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
              'https://s3-alpha-sig.figma.com/img/83cd/df2e/cbbafce7621f797d710eb1be26e41b7a?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ZludsoYH0pDh5I-vbOcjqdtlRFd~V8~maQkM-AlzZkUHFvoVjfDDI-ei-4bJrOsuPJ-8MibU6Jgcig4sQymIXktvnvdgf5AEQQJVTwW0PajrZfNe-yIf542789IOli~nue2vLIbw8F7aqrd2tcvoEZCKwL3wNuAP24gdQFbcUVEKyRBegqW4-XrmHOYBqb7pwfb~ltzkujuxKh9bLw3aKFq9-LWipKXbzsf3sfJKc8CuOdMQtsTkJ5KcWPdV7FPmdsxmdM01gOXekLuNttXtse2rNhyRtmPozXKNKC2S4ggxpZxTOpBfafSCjo55-bPmia5pmtmDjV9GDioMDhZI3A__',
          imageBuilder: (final context, final imageProvider) => ClipRRect(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 600,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.08),
                image: DecorationImage(
                    image: imageProvider,
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.cover),
              ),
            ),
          ),
          progressIndicatorBuilder:
              (final context, final url, final downloadProgress) => ClipRRect(
            child: Container(
              width: 375,
              height: 600,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.08)),
              child: const CupertinoActivityIndicator(),
            ),
          ),
          errorWidget: (final context, final url, final error) => ClipRRect(
            child: Container(
              width: 375,
              height: 600,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.08)),
            ),
          ),
        ),
        Positioned(
          top: 231.44,
          left: 42.84,
          child: Text(
            'LUXURY\n FASHION\n&ACCESSORIES',
            style: GoogleFonts.bodoniModa(
              fontSize: 38.66,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              height: 1.0,
              letterSpacing: 1.21,
              color: const Color.fromARGB(255, 105, 105, 105),
            ),
          ),
        ),
        Positioned(
          top: 520,
          left: 65,
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromRGBO(0, 0, 0, 0.3),
            ),
            child: Text(
              'EXPLORE COLLECTION',
              style: GoogleFonts.tenorSans(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
