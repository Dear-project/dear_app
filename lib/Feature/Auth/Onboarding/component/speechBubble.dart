import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpeechBubble extends StatelessWidget {
  SpeechBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _SpeechBubblePainter(
        clipper: _SpeechBubbleClipper(),
        shadow: Shadow(
          color: Colors.black.withOpacity(0.14),
          blurRadius: 4,
          offset: Offset(0, 4)
        )
      ),
      child: ClipPath(
        clipper: _SpeechBubbleClipper(),
        child: Container(
            width: 145,
            height: 40,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 11,
                    height: 11,
                    child: Image.asset("assets/icons/idcard.png")
                ),
                SizedBox(width: 3,),
                Text("회원가입하고", style: TextStyle(
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w600,
                    fontSize: 10
                ),
                ),
                SizedBox(width: 3,),
                Text("숨은 꿀팁", style: TextStyle(
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w800,
                    fontSize: 10
                ),
                ),
                SizedBox(width: 3,),
                Text("받기", style: TextStyle(
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w600,
                    fontSize: 10
                ),
                ),
              ],
            )
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
      ..addRRect(RRect.fromRectAndRadius(Rect.fromCenter(center: Offset(midw, midh), width: w, height: fixh), Radius.circular(5)))
      ..moveTo(midw - 8, fixh)
      ..arcToPoint(
        Offset(midw, h),
        radius: Radius.circular(2),
        clockwise: true,
      )
      ..moveTo(midw, h)
      ..arcToPoint(
        Offset(midw + 8, fixh),
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
