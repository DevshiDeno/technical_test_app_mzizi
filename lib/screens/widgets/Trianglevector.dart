
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TriangularShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(20, 20), // Size of the CustomPaint widget
      painter: TriangularPainter(), // Custom painter for drawing the triangular shape
    );
  }
}

class TriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white // Color of the triangular shape
      ..style = PaintingStyle.fill; // Fill style

    final Path path = Path();
    path.moveTo(0, size.height); // Start from bottom-left corner
    path.lineTo(size.width / 2, 0); // Draw line to the top-center
    path.lineTo(size.width, size.height); // Draw line to bottom-right corner
    path.close(); // Close the path to form a triangular shape

    canvas.drawPath(path, paint); // Draw the triangular shape on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // No need to repaint since the shape doesn't change
  }
}