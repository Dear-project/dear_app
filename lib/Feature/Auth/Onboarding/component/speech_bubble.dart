import 'package:flutter/material.dart';

class SpeechBubble extends StatelessWidget {
  Widget child;
  SpeechBubble({ super.key, required this.child });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: _SpeechBubblePainter(
            clipper: _SpeechBubbleClipper(),
            shadow: Shadow(
                color: Colors.black.withOpacity(0.14),
                blurRadius: 4,
                offset: Offset(0, 4))),
        child: ClipPath(
            clipper: _SpeechBubbleClipper(),
            child: Container(
              width: 148,
                height: 40,
                color: Colors.white,
                child: child
            )
        )
    );
  }
}

class _SpeechBubblePainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _SpeechBubblePainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _SpeechBubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    double fixh = h - 10;
    double midh = h / 2;
    double midw = w / 2;

    Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromCenter(center: Offset(midw, midh), width: w, height: fixh),
          Radius.circular(5)))
      ..moveTo(midw - 12, fixh)
      ..arcToPoint(
        Offset(midw, h),
        radius: Radius.circular(2),
        clockwise: true,
      )
      ..moveTo(midw, h)
      ..arcToPoint(
        Offset(midw + 12, fixh),
        radius: Radius.circular(2),
        clockwise: true,
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
