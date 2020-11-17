import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

class ImageScannerAnimation extends AnimatedWidget {
  ImageScannerAnimation(this.stopped, this.width,
      {Key key, AnimationController animation})
      : super(key: key, listenable: animation);
  final bool stopped;
  final double width;
  Animation<double> get _progress => listenable;

  Widget build(BuildContext context) {
    //final Animation<double> animation = listenable;
    final scorePosition = ((1 - _progress.value) * 400) + 150;
    //print("_progress.value " + _progress.value.toString());
    Color color1 = Color(0x0032CD32);
    Color color2 = Color(0x5532CD32);

    if (_progress.status == AnimationStatus.reverse) {
      color1 = Color(0x0032CD32);
      color2 = Color(0x5532CD32);
    }

    return new Positioned(
        bottom: scorePosition,
        left: -200,
        child: new Opacity(
            opacity: (stopped) ? 0.0 : 1.0,
            child: Container(
              height: 100,
              width: width,
              decoration: new BoxDecoration(
                  //borderRadius: BorderRadius.circular(3.0),
                  //shape: BoxShape.circle,
                  gradient: new RadialGradient(
                center: const Alignment(0, 6), // near the top right
                radius: 3.5,
                stops: [0.6, 0.9],
                colors: [color2, color1],
              )),
            )));
  }
}
