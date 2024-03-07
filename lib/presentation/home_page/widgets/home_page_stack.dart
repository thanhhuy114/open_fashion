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
        Image.network(
          alignment: Alignment.centerLeft,
          fit: BoxFit.cover,
          width: 556,
          height: 620,
          'https://s3-alpha-sig.figma.com/img/83cd/df2e/cbbafce7621f797d710eb1be26e41b7a?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=GYdAoLgSAOvRFXes41bQVgBK2-9ydD88D-pskZiSBJRK5tY9L514n5De1yOGImFDQHrYegiOHsPoKyXjWYXSbU5D4YHbHpQm--YIVkIGLMFFKJYhgUdnPsBE7TtFfZajeYv7uwdLmXr3ygYwKU5YQW~CMltmlq~PocFYKcaT5j-ETDYZ7QbhfrOUiuZai1QHPtgJvqUOWEb0uHPKXkX3i37L6N3GLwxpozRx~Eo9C0I47j~7TItiKt7isnN0lLErzp74kdI6aFG8waLuPl5emC35wdZoW5xZ1EE2XynB8C0m1YhFJOFdyItVCI1g0-yTrLH7DAtW12Cmj4tfJHGrhQ__',
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
            padding: const EdgeInsets.fromLTRB(30,8,30,8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromRGBO(0, 0, 0, 0.3),
            ),
            child: Text(
              'EXPLORE COLLECTION',
              style: GoogleFonts.tenorSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white,),
            ),
          ),
        ),
      ],
    );
  }
}
