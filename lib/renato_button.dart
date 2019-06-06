import 'dart:async';

import 'package:flutter/material.dart';

class RenatoButton extends StatelessWidget {
  Color color;
  Color progressColor;
  Widget textButton;
  Function state;
  double endHightAnim;

  RenatoButton(
      {this.color,
      this.progressColor,
      this.textButton,
      this.state,
      this.endHightAnim});
      
  int statusClick = 0;
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return ButtonController(
        color: this.color,
        progressColor: this.progressColor,
        textButton: this.textButton,
        state: this.state,
        endHightAnim: this.endHightAnim);
  }
}

class ButtonController extends StatefulWidget {
  Color color;
  Color progressColor;
  Widget textButton;
  Function state;
  double endHightAnim;

  ButtonController({
    this.color,
    this.progressColor,
    this.textButton,
    this.endHightAnim,
    this.state,
  });

  @override
  _RenatoButtonControllerState createState() => _RenatoButtonControllerState();
}

class _RenatoButtonControllerState extends State<ButtonController>
    with TickerProviderStateMixin {
  final StreamController stateAnimation = new StreamController();

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
    _tween = Tween<double>(begin: 320.0, end: 70);

    buttonSqueezeAnimation = _tween.animate(new CurvedAnimation(
        parent: controller, curve: new Interval(0.0, 0.250)))
      ..addListener(() {});

    buttonZoomout = new Tween(begin: 70.0, end: this.widget.endHightAnim)
        .animate(new CurvedAnimation(
      parent: controller,
      curve: new Interval(
        0.550,
        0.900,
        curve: Curves.bounceOut,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return InkWell(
      onTap: () async {
        controller.forward();
      },
      child: statusClick == 0 ? stateInitial() : Container(),
    );
  }

  Widget stateInitial() {
    return StreamBuilder(
        stream: stateAnimation.stream,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          statusClick = snapshot.data;
          int valor = this.widget.state();
          stateAnimation.add(valor);

          return AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget child) {
              return Container(
                  width: statusClick == 0
                      ? buttonSqueezeAnimation.value
                      : buttonZoomout.value,
                  height: statusClick == 0 ? 60 : buttonZoomout.value,
                  alignment: FractionalOffset.center,
                  decoration: BoxDecoration(
                    color: this.widget.color == null
                        ? Colors.cyan
                        : this.widget.color,
                    borderRadius: statusClick == 0
                        ? new BorderRadius.all(Radius.circular(30.0))
                        : BorderRadius.all(Radius.circular(00.0)),
                  ),
                  child: buttonSqueezeAnimation.value > 75.0
                      ? new Center(
                          child: widget.textButton == null
                              ? Text("Animation")
                              : widget.textButton,
                        )
                      : statusClick == 0
                          ? new CircularProgressIndicator(
                              value: null,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                widget.progressColor == null
                                    ? Colors.purple
                                    : widget.progressColor,
                              ),
                            )
                          : null);
            },
          );
        });
  }
}
