import 'package:flutter/material.dart';

class HeadersTriangulo extends StatelessWidget {
  const HeadersTriangulo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.6,
      width: size.width,
      child: CustomPaint(
        painter: _HeadersTriangulo(),
      ),
    );
  }
}

class _HeadersTriangulo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        Rect.fromCircle(center: const Offset(165, 55), radius: 180);

    const Gradient gradient = LinearGradient(
      colors: <Color>[
      Color.fromARGB(255, 102, 87, 121),
      Color(0xffC012FF),
      Color(0xff6D05FA),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.2, 0.5, 1.0]
    );

    
    final paint = Paint()..shader = gradient.createShader(rect);

    paint.color = const Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}