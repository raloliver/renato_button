import 'package:flutter/material.dart';


class RenatoButton extends StatelessWidget {
  double width;
  double height;
  Color color;
  MaterialColor progressColor;
  Widget textButton;

  RenatoButton({this.width, this.height, this.color,this.progressColor,this.textButton});
  int statusClick = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ButtonAnimationController(

        width: this.width,
        height: this.height,
        color: this.color,
        textButton: this.textButton,
      );

  }
}


class ButtonAnimationController extends StatefulWidget {
  double width;
  double height;
  Color color;
  MaterialColor progressColor;
  Widget textButton;

  ButtonAnimationController(
      {this.width,
      this.height,
      this.color,
      this.progressColor,
      this.textButton});

  @override
  _ButtonAnimationControllerState createState() =>
      _ButtonAnimationControllerState();
}

class _ButtonAnimationControllerState extends State<ButtonAnimationController>
    with TickerProviderStateMixin {
  int statusClick = 0;
  AnimationController controller;
  Animation<double> buttonSqueezeAnimation;
  Animation<double> buttonZoomout;

  Tween _tween;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _tween = Tween<double>(
        begin: widget.width == null ? 200 : widget.width, end: 70);

    buttonSqueezeAnimation = _tween.animate(new CurvedAnimation(
        parent: controller, curve: new Interval(0.0, 0.350)))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          print("Terminou!");
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        controller.forward();
      },
      child: stateInitial(),
    );
  }

  Container stateInitial() {
    return Container(
        width: buttonSqueezeAnimation.value,
        height: widget.height == null ? 60.0 : widget.height,
        decoration: BoxDecoration(
          color: this.widget.color,
          borderRadius: new BorderRadius.all(const Radius.circular(50.0)),
        ),
        child: buttonSqueezeAnimation.value > 75.0
            ? new Center(
                child: widget.textButton == null
                    ? Text("Animation")
                    : widget.textButton,
              )
            : new CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
                  widget.progressColor == null
                      ? Colors.purple
                      : widget.progressColor,
                ),
              ));
  }
}
