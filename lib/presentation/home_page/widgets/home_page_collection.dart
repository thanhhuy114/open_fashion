import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../collection_page/views/collection_screen.dart';

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
          onTap: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (final context) => const CollectionScreen(),));
            });
          },
          child: Container(
            child: Stack(
              children: [
                Image.network(
                  width: MediaQuery.of(context).size.width,
                  height: 244.79,
                  fit: BoxFit.cover,
                  'https://s3-alpha-sig.figma.com/img/7b23/ee27/2bd6b4e6adadc2d3b1f340be62f9ef67?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=NU9Ew~PsRbpALFO~1qv~A00BaOXlB73F4CAIDI1cZGdYztcFmdt4v81dMbJDpf9C19X5Za0-F8FYJGpBzwyEw5WJB8E0hE8-c3lFc4~lHljAi19MdBJOuDhjpvjjYa4JZMQBuoGilc7E7igI71tPxVbYaOTWJtLvLeG~jlFV-VNZPzDDUMNdDQE5Tn4aWUQRAQItTQc7OK71cltYIt5jokNWjRGc5YDIQQT32XAac5kEvfZolwq8ZcD-t6gnrsJSfAP3ZXlo4kyGHma6IBlE6swWRVh1byBu8TOnHl2t9J0RCSAK1qdCybC6YfVf63~QYVOs5v8Zqgi~oxpEM9URpw__',
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
                    fit: BoxFit.cover,height: 296, 
                    'https://s3-alpha-sig.figma.com/img/13bc/5e0b/7aabb37727bd5c3323cdb05c010cd677?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=abQvtONURlZT-KRXy~3vPKrrVgoamUNatFs6CJufS0b4JzrrUYaEcsDgm9ZPoA3I-UeVsYmzv1kDKrpjvP-GER7YhpKtXT-oc6hc9h6nPiQwlbgT0C~oIf-cwg6510MQwZ7IvAp6xw4~qNX7CTUfs4lMhaQCZYmja8WS5CCAVEOXbxBvEbo~fmqivBid7At9fdW5Hgip5wpEh056Qc86UjDC9sAVZZcJ4zRq52l3zoRfFUAKebFydWaHlLHLikBlUEFeP0VEgOrNy0FZBdZePk12yrTP0bxcw3J87t5LUnwcOAZTCLAQbHCqzMOjMbDIPeI3gIRlJZZxN9PQLH8AzQ__',
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
                    'https://s3-alpha-sig.figma.com/img/542d/b60d/cecfd36dc4b2cb3c9806f14d338c939e?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AaMV8bcjB~mB6tQy4AOZravy7TMXKKsrL656Lcwn9L~4k5rp8XuOaXpwslilhXhF7nrgUTbHn5RBmqnUN7I00kLhAfYihzqEn5FAOUeY2nh814OKqOXxgR8ycVtODTVhMQlsgdOhaNMNsQncmReq6rEcPBg20iEVHpTMW2yetQz6cSoDNPHarvf25vbUDCmKfr92lrUB5G1LkXjzFKKFrqv2i9CJ24dV7OL5ZNzj3lHATTAw2dlek1v1okxJrZhdv6mjuwwo4bAUR80hjdluT-lT5bbmwpLTYwoiBK31go3oiOZrJKFiPLG3uPUe176OEmrWHRCybghT7egUZzLf0A__',
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
                      Color.fromRGBO(0, 0, 0, 0.5),),
                ),
                onPressed: () {

                },
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
