import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../feature/collection/presentation/collection_page/views/collection_screen.dart';

class HomePageCollection extends StatefulWidget {
  const HomePageCollection({super.key});

  @override
  State<HomePageCollection> createState() => _HomePageCollectionState();
}

class _HomePageCollectionState extends State<HomePageCollection> {
  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Text(
          'COLLECTIONS',
          style: GoogleFonts.tenorSans(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            letterSpacing: 4,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () async {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (final context) => const CollectionScreen(),
                ),
              );
            });
          },
          child: Stack(
            children: [
              Image.network(
                width: MediaQuery.of(context).size.width,
                height: 244.79,
                fit: BoxFit.cover,
                'https://s3-alpha-sig.figma.com/img/7b23/ee27/2bd6b4e6adadc2d3b1f340be62f9ef67?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hxLqY-riADzffbNoabhz8pW06cOpibCZsg2yBTLbAIMm9YNt3MCc5vSdBc-dTKLoZFj0AuGrKk7xIMyZD~t68cZSCZqtseyIFkLjCF74yHcBFLeGOjHzKzDZlSvDQQeglQcz3ygK-YB2JUpyxNfsN59Nhq7iu5csdBbs~jNuRdeLm8s7pPdL5v2h6KnfE3UcwtORFr-kn0bhUEyMOtcTfzxUBjcP9ioAN-Yq-VI8yHLTQU3SUbUFIs9lvIuTxBXH1WSa99wMT7TO73LuzudIzfndqU31AQRp38rArlYrbyrXaDYvteqzP11gWkES9bs4EhaNFOa4nfZ5mQ~5Cv~wmg__',
              ),
              Positioned(
                top: 22.49,
                left: 220.93,
                child: Text(
                  '10',
                  style: GoogleFonts.bodoniModa(
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                    fontSize: 162.7,
                    letterSpacing: -31.5,
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
              ),
              Positioned(
                top: 99.28,
                left: 230.21,
                child: Text(
                  'October',
                  style: GoogleFonts.bodoniModa(
                    fontWeight: FontWeight.w700,
                    fontSize: 41.86,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 143.12,
                left: 220.21,
                child: Text(
                  'COLLECTION',
                  style: GoogleFonts.tenorSans(
                    fontWeight: FontWeight.w400,
                    height: 2.09,
                    letterSpacing: 6.06,
                    fontSize: 12.93,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 30),
          child: Stack(
            children: [
              ClipRect(
                child: Align(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.5,
                  child: Image.network(
                    fit: BoxFit.cover,
                    height: 296,
                    'https://s3-alpha-sig.figma.com/img/13bc/5e0b/7aabb37727bd5c3323cdb05c010cd677?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hce-Eqxrrj1QAHYhcpn~KW1n1Ax-dveYxQuFD3XdFyd7hL36sUWxZywz8zHPOjRiSCIeq0T3h6TOLbh~Dyx9nnLqYhPye1l5vNLdKrFnAF2~-arSYsmNm-N81m2-3q8mcIF4LG1fTcUbr7ztY8S7G5cL0g1qU~U4beCCLz5XiEyjPZYokbAc31DHwciU9entg2NJV11mEXyfFXXM892OBKMizxGtRUt4v~eT8ivNCrK24Y6HtbBxSnfB7FKbsH7WO1ubfCtIAKyVUBEcBibWJCfeaKdeq0tJT9m1-fUdglgbO2j-K1qmdafuBdHir7W4lEHjpi-dJbCA5TqnzPzueg__',
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 40,
                child: Text(
                  'Autumn',
                  style: GoogleFonts.bodoniModa(
                    fontWeight: FontWeight.w700,
                    fontSize: 41.86,
                    fontStyle: FontStyle.italic,
                    letterSpacing: -1,
                    color: Colors.black54,
                  ),
                ),
              ),
              Positioned(
                top: 75.4,
                left: 40,
                child: Text(
                  'COLLECTION',
                  style: GoogleFonts.tenorSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.32,
                    letterSpacing: 5.31,
                  ),
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            ClipRect(
              child: Container(
                alignment: Alignment.centerRight,
                child: Align(
                  alignment: Alignment.topRight,
                  widthFactor: 0.85,
                  heightFactor: 0.38,
                  child: Image.network(
                    fit: BoxFit.fitWidth,
                    'https://s3-alpha-sig.figma.com/img/542d/b60d/cecfd36dc4b2cb3c9806f14d338c939e?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=aUHQ~GNBkKpA9vjoY2OYHUnGYxTqrvXJ2NozHEe8ZyvpFIeWuOjLEBCHPZkH-SUYZJQYH5uTi8rM7EcPFEFuBlaK1VhYRdl5w0I1Sx~1aDtdUPfs4yTc28gz8X0WTUgaYrQ4My~faTHcV4qGeGJtDjesARRCciSeyBV9vKx2p~EoNYxmR1ftxMAQamRmkvuG~uJRqqIcauBcFQtmgtxWmFAEn8CzSPAL0eluKwLcow68qoMV9dx-9XtVsmPsum3wWuSeCdlwnhJfmRDBaKvzbpNcVsygS2vePGLUB1uqQ6lNvZ4d7aZ4I9uld0oxZa7Jt3trhBdglYt0pUgqUrijkg__',
                  ),
                ),
              ),
            ),
            Positioned(
              top: 75.84,
              left: 178.36,
              child: IconButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
