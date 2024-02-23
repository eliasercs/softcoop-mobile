import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TimeLineComponent extends StatelessWidget {
  final double width;
  final int year;
  //final double height;
  const TimeLineComponent({super.key, required this.width, required this.year});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomPaint(
      size: Size(width, size.height),
      painter: TimeLinePainter(year: year),
    );
  }
}

class TimeLinePainter extends CustomPainter {
  final int year;
  TimeLinePainter({required this.year});

  @override
  void paint(Canvas canvas, Size size) {
    final currentYear = DateTime.now().year;

    final paint = Paint()
      ..color = Color(year == currentYear ? 0xFFC41E3D : 0xFF005741)
      ..strokeWidth = 2;

    /*canvas.drawLine(
        Offset(size.width / 2, 0), Offset(size.width / 2, size.height), paint);*/
    canvas.drawLine(
        Offset(size.width / 2, 0), Offset(size.width / 2, size.height), paint);

    // Dibujar los puntos

    for (double i = 0; i < size.height; i += size.height) {
      canvas.drawCircle(Offset(size.width / 2, i), 6.0, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class TimeLineItem extends StatelessWidget {
  final Size size;
  final String title;
  final Widget content;
  final Function? onTouch;
  const TimeLineItem(
      {super.key,
      required this.size,
      required this.title,
      required this.content,
      this.onTouch});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TimeLineComponent(
            width: size.width * 0.1,
            year: int.parse(title),
          ),
          SizedBox(
            width: (size.width * 0.9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {
                    onTouch!();
                  },
                  child: content,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
