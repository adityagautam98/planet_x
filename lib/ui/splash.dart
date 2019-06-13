import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:planet_x/ui/Homepage.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SplashScreen();
  }
}

class _SplashScreen extends State with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController controller2;
  Animation<double> animation2;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2, milliseconds: 100), () {
      return onDoneLoading();
    });
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    controller2 = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animation2 = CurvedAnimation(parent: controller2, curve: Curves.easeInBack);
    controller2.forward();
  }

  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Homepage()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: Container(
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.indigo[600],
              Colors.indigo[500],
              Colors.indigo[400],
              Colors.indigo[300],
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeTransition(
                  opacity: animation,
                  child: Image.asset(
                    "images/earth2.png",
                    alignment: Alignment.topCenter,
                    width: 250,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FadeTransition(
                        opacity: animation2,
                        child: new Text(
                          "WEIGHT ON PLANETS",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),

                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
