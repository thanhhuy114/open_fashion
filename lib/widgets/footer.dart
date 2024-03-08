import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
    this.email = '___@___.____',
    this.phone = '+60 825 876',
    this.closeTime = '08:00',
    this.openTime = '22:00',
    this.daysPerWeek = 'Everyday',
    this.copyRight = 'OpenUI All Rights Reserved.',
  });
  final String email;
  final String phone;
  final String openTime;
  final String closeTime;
  final String daysPerWeek;
  final String copyRight;

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          // Icon
          Container(
            width: size.width / 2,
            height: 70,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/icons/Twitter.jpg'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/icons/Instagram.jpg'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/icons/YouTube.jpg'),
                ),
              ],
            ),
          ),

          // Duong khe
          const DividerCustom(),

          //Lien he
          Container(
            width: size.width,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 2.4,
                  ),
                ),
                Text(
                  phone,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 2.4,
                  ),
                ),
                Text(
                  '$openTime - $closeTime - $daysPerWeek',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 2.4,
                  ),
                ),
              ],
            ),
          ),

          // Duong khe
          const DividerCustom(),

          //About Contact Blog
          Container(
            width: size.width,
            height: 70,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 2.4,
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 2.4,
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Blog',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 2.4,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Copyright
          Container(
            alignment: Alignment.center,
            color: const Color(0xFFf9f9f9),
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'Copyright© $copyRight',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}

class DividerCustom extends StatelessWidget {
  const DividerCustom({super.key});

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 3,
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Divider(
            thickness: 0.4,
            color: Color.fromRGBO(85, 85, 85, 1),
          ),
          CustomPaint(
            size: const Size(20, 20),
            painter: DiamondPainter(),
          ),
        ],
      ),
    );
  }
}

class DiamondPainter extends CustomPainter {
  DiamondPainter({this.color = Colors.white});
  final Color color;

  @override
  void paint(final Canvas canvas, final Size size) {
    final Paint paint = Paint()..color = color;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    final double diamondWidth = size.width * 0.8;
    final double diamondHeight = size.height * 0.8;

    final Path path = Path()
      ..moveTo(centerX, centerY - diamondHeight / 2) // Điểm trên
      ..lineTo(centerX + diamondWidth / 2, centerY) // Điểm bên phải
      ..lineTo(centerX, centerY + diamondHeight / 2) // Điểm dưới
      ..lineTo(centerX - diamondWidth / 2, centerY) // Điểm bên trái
      ..close();

    canvas.drawPath(path, paint);

    final Paint border = Paint()
      ..color = const Color.fromRGBO(85, 85, 85, 1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawPath(path, border);
  }

  @override
  bool shouldRepaint(final CustomPainter oldDelegate) {
    return false;
  }
}
