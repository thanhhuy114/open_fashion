import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    icon: Image.asset('assets/icons/Twitter.jpg')),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/Instagram.jpg')),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/YouTube.jpg'))
              ],
            ),
          ),

          // Duong khe
          const DividerCustom(),

          //Lien he
          Container(
            width: size.width,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'support@openui.design',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 2.4,
                  ),
                ),
                Text(
                  '+60 825 876',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 2.4,
                  ),
                ),
                Text(
                  '08:00 - 22:00 - Everyday',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 2.4,
                  ),
                )
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
                        color: Colors.black),
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
                        color: Colors.black),
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
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),

          //Copyright
          Container(
            alignment: Alignment.center,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: const Text(
              'Copyright© OpenUI All Rights Reserved.',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}

class DividerCustom extends StatelessWidget {
  const DividerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
          )
        ],
      ),
    );
  }
}

class DiamondPainter extends CustomPainter {
  final Color color;

  DiamondPainter({this.color = Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
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
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
