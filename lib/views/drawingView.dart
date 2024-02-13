import 'package:alwrite/controllers/drawingController.dart';
import 'package:alwrite/models/dotInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawingPage extends StatefulWidget {
  const DrawingPage({super.key});

  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  @override
  Widget build(BuildContext context) {
    var p = Provider.of<DrawingProvider>(context);
    return Scaffold(
        body: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned.fill(
                  child: CustomPaint(
                painter: DrawingPainter(p.lines),
              )),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanStart: (s) {
                  if (p.eraseMode) {
                    p.erase(s.localPosition);
                  } else {
                    p.drawStart(s.localPosition);
                  }
                },
                onPanUpdate: (s) {
                  if (p.eraseMode) {
                    p.erase(s.localPosition);
                  } else {
                    p.drawing(s.localPosition);
                  }
                },
                child: Container(),
              ),
            ],
          )),
          Container(
            color: Colors.grey[900],
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _colorWidget(Colors.black),
                      _colorWidget(Colors.red),
                      _colorWidget(Colors.yellow),
                      _colorWidget(Colors.green),
                      _colorWidget(Colors.blue),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 5),
                        child: Slider(
                          activeColor: Colors.white,
                          inactiveColor: Colors.white,
                          value: p.size,
                          onChanged: (size) {
                            p.changeSize = size;
                          },
                          min: 3,
                          max: 15,
                        ),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        p.changeEraseMode();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Text(
                          '지우개',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: p.eraseMode
                                  ? FontWeight.w900
                                  : FontWeight.w300),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _colorWidget(Color color) {
    var p = Provider.of<DrawingProvider>(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        p.changeColor = color;
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: p.color == color
              ? Border.all(color: Colors.white, width: 4)
              : null,
          color: color,
        ),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  DrawingPainter(this.lines);
  final List<List<DotInfo>> lines;
  @override
  void paint(Canvas canvas, Size size) {
    for (var oneLine in lines) {
      Color? lineColor;
      double? lineSize;
      var l = <Offset>[];
      var p = Path();
      for (var oneDot in oneLine) {
        lineColor ??= oneDot.color;
        lineSize = oneDot.size;
        l.add(oneDot.offset);
      }
      if (lineColor != null && lineSize != null) {
        p.addPolygon(l, false);
        canvas.drawPath(
            p,
            Paint()
              ..color = lineColor
              ..strokeWidth = lineSize
              ..strokeCap = StrokeCap.round
              ..style = PaintingStyle.stroke);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
