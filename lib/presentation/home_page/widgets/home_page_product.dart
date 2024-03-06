import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/menu_arrival_response_model.dart';

class HomePageProduct extends StatefulWidget {
  const HomePageProduct({super.key, required this.pro});
  final ItemsModel pro;

  @override
  State<HomePageProduct> createState() => _HomePageProductState();
}

class _HomePageProductState extends State<HomePageProduct> {
  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: 0.92,
              child: Image.network(
                fit: BoxFit.cover,
                widget.pro.image,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              Text(
                widget.pro.content,
                style: GoogleFonts.tenorSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                r'$' '${widget.pro.price}',
                style: GoogleFonts.tenorSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
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
