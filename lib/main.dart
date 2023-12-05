import 'package:flutter/material.dart';
import 'package:new_project/pages/home.dart';
import 'package:new_project/pages/choose_location.dart';
import 'package:new_project/pages/loding.dart';

void main() {
  runApp(MaterialApp(
    initialRoute:'/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}

