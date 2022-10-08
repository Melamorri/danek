import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final GestureTapCallback onPressed;
  final Widget child;
  final bool enabled;
  final Color color;
  final double height;
  final double width;
  final int duration;
  final BoxShape shape;
  final Color borderColor;
  final Color shadowColor;

  const AnimatedButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.borderColor = Colors.black,
      this.enabled = true,
      this.color = Colors.blue,
      this.height = 55,
      this.width = 160,
      this.duration = 70,
      this.shape = BoxShape.rectangle,
      this.shadowColor = Colors.black})
      : super(key: key);

  @override
  AnimatedButtonState createState() => AnimatedButtonState();
}

class AnimatedButtonState extends State<AnimatedButton> {
  static const Curve curve = Curves.easeIn;
  static const double shadowHeight = 6;
  double _position = 6;

  @override
  Widget build(BuildContext context) {
    final double totalHeight = widget.height - shadowHeight;

    return GestureDetector(
      onTapDown: widget.enabled ? _pressed : null,
      onTapUp: widget.enabled ? _unPressedOnTapUp : null,
      onTapCancel: widget.enabled ? _unPressed : null,
      child: SizedBox(
        width: widget.width,
        height: widget.height, //totalHeight + shadowHeight,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                height: totalHeight,
                width: widget.width,
                decoration: BoxDecoration(
                    color: widget.shadowColor,
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
            AnimatedPositioned(
              curve: curve,
              duration: Duration(milliseconds: widget.duration),
              bottom: _position,
              child: Container(
                height: totalHeight,
                width: widget.width,
                decoration: BoxDecoration(
                    color: widget.enabled ? widget.color : Colors.grey,
                    borderRadius: widget.shape != BoxShape.circle
                        ? const BorderRadius.all(
                            Radius.circular(25),
                          )
                        : null,
                    shape: widget.shape,
                    border: Border.all(color: widget.borderColor, width: 3)),
                child: Center(
                  child: widget.child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _pressed(_) {
    setState(() {
      _position = 0;
    });
  }

  void _unPressedOnTapUp(_) => _unPressed();

  void _unPressed() {
    setState(() {
      _position = 4;
    });
    widget.onPressed();
  }
}
