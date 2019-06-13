import 'package:flutter/material.dart';
import 'package:planet_x/ui/splash.dart';
import 'package:planet_x/ui/Homepage.dart';
void main(){
  runApp(MaterialApp(
    title: "Weight on Planet X",
    debugShowCheckedModeBanner: false,
    home: new Splash(),
  ));
}