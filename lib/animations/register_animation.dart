//@dart=2.9
import 'package:flutter/material.dart';

class RegisterAnimation extends StatelessWidget {
  final Animation<double> controller;
  final Animation<double> buttonSqueezeAnimation;
  final Animation<double> buttonZoomOut;

  RegisterAnimation({ this.controller }) :

        buttonSqueezeAnimation = new Tween(
            begin: 280.0,
            end: 60.0
        ).animate(
            new CurvedAnimation(
                parent: controller,
                curve: new Interval(0.0, 0.150)
            )
        ),

        buttonZoomOut = new Tween(
            begin: 70.0,
            end: 1000.0
        ).animate(
            new CurvedAnimation(
                parent: controller,
                curve: new Interval(0.550, 0.999 , curve: Curves.bounceOut)
            )
        );

  Widget _animationBuilder(BuildContext context , Widget child) {
    return buttonZoomOut.value <= 300
        ?  new Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: buttonZoomOut.value == 70
          ? buttonSqueezeAnimation.value
          : buttonZoomOut.value,
      height: buttonZoomOut.value == 70
          ? 45
          : buttonZoomOut.value,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
          gradient: new  LinearGradient(
              colors: <Color>[
                const Color(0xff30353A),
                const Color(0xff7F8285)
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight
          ),
          borderRadius: buttonZoomOut.value < 400
              ? new BorderRadius.all(const Radius.circular(10))
              : new BorderRadius.all(const Radius.circular(0))
      ),
      child: buttonSqueezeAnimation.value > 75
          ? new Text(
        "Register",
        style: new TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w300,
            letterSpacing: .3
        ),
      )
          : buttonZoomOut.value < 300.0
          ? new CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
      )
          : null
      ,
    )
        :  new Container(
      width: buttonZoomOut.value,
      height: buttonZoomOut.value,
      decoration: new BoxDecoration(
          shape: buttonZoomOut.value < 500
              ? BoxShape.circle
              : BoxShape.rectangle,
          color : const Color(0xff30353A)
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new AnimatedBuilder(
        animation: controller ,
        builder: _animationBuilder
    );
  }

}