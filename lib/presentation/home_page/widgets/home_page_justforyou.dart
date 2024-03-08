import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/menu_arrival_response_model.dart';
import 'RhombusContainer.dart';

class HomePageJustForYou extends StatefulWidget {
  const HomePageJustForYou({super.key, required this.jfu});
  final List<JustForYouModel> jfu;

  @override
  State<HomePageJustForYou> createState() => _HomePageJustForYouState();
}

class _HomePageJustForYouState extends State<HomePageJustForYou> {
  final PageController pageController = PageController(viewportFraction: 0.65);
  int currentPage = 0;
  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Text(
          'JUST FOR YOU',
          style: GoogleFonts.tenorSans(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            letterSpacing: 4,
          ),
        ),
        Image.asset('assets/img/3.png'),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 450,
          child: Stack(
            children: [
              // PageView
              PageView.builder(
                controller: pageController,
                itemCount: widget.jfu.length,
                onPageChanged: (final int page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                itemBuilder: (final context, final index) {
                  return ItemPage(
                    img: widget.jfu[index].image,
                    con: widget.jfu[index].content,
                    price: widget.jfu[index].price,
                  );
                },
              ),
              // Hiển thị số trang
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.jfu.length, (final index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Rhombus(color: currentPage==index? const Color.fromRGBO(136, 136, 136, 1):Colors.white),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),

        /* SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 450,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: jfu.length,
            itemBuilder: (final context, final index) {
              return ItemPage(
                img: jfu[index].image,
                con: jfu[index].content,
                price: jfu[index].price,
              );
            },
          ),
        ), */
      ],
    );
  }
}

class ItemPage extends StatelessWidget {
  const ItemPage({
    super.key,
    required this.img,
    required this.con,
    required this.price,
  });
  final String img;
  final String con;
  final int price;

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(width: 254, height: 311, img),
        SizedBox(
          width: 232,
          child: Column(
            children: [
              Text(
                con,
                style: GoogleFonts.tenorSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                r'$' '$price',
                style: GoogleFonts.tenorSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: const Color.fromRGBO(221, 133, 96, 1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
