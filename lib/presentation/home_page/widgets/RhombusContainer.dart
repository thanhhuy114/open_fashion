import 'package:flutter/material.dart';

class RhombusShape extends CustomPainter {
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

class RhombusContainer extends StatelessWidget {

  const RhombusContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(final BuildContext context) {
    return CustomPaint(
      painter: RhombusShape(),
      child: ClipPath(
        clipper: RhombusClipper(),
        child: Container(
          child: child,
        ),
      ),
    );
  }
}

class RhombusClipper extends CustomClipper<Path> {
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

class Rhombus extends StatelessWidget {
  const Rhombus({super.key});

  @override
  Widget build(final BuildContext context) {
    return RhombusContainer(
      child: Container(
        width: 4,
        height: 4,
        color: Colors.orange[700],
        child: const Text(''),
        ),
      );
  }
}
