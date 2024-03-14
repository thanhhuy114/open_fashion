import 'package:flutter/material.dart';

class RhombusIndicatorShape extends CustomPainter {
  @override
  void paint(final Canvas canvas, final Size size) {
    final Paint paint = Paint()..color = Colors.black;
    final Path path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(0, size.height * 0.5);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(final CustomPainter oldDelegate) {
    return false;
  }
}

class RhombusIndicatorContainer extends StatelessWidget {
  const RhombusIndicatorContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(final BuildContext context) {
    return CustomPaint(
      painter: RhombusIndicatorShape(),
      child: ClipPath(
        clipper: RhombusIndicatorClipper(),
        child: Container(
          child: child,
        ),
      ),
    );
  }
}

class RhombusIndicatorClipper extends CustomClipper<Path> {
  @override
  Path getClip(final Size size) {
    final Path path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(0, size.height * 0.5);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(final CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RhombusIndicator extends StatelessWidget {
  const RhombusIndicator({
    super.key,
    required this.color,
    required this.checkIndex,
  });
  final Color? color;
  final bool? checkIndex;
  @override
  Widget build(final BuildContext context) {
    return RhombusIndicatorContainer(
      child: Container(
        decoration: BoxDecoration(
          color: checkIndex! ? const Color(0xff888888) : Colors.white,
        ),
      ),
    );
  }
}
