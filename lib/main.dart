import 'package:flutter/material.dart';
import 'pages/welcome.dart';
import 'pages/login.dart';
import 'pages/users/index.dart';
import 'pages/users/profile.dart';

void main() {
  runApp(MaterialApp(
    title: 'AppRoot',
    initialRoute: '/',
    routes: {
      '/': (context) => Welcome(),
      '/login': (context) => Login(),
      '/index': (context) => Index(),
      Profile.routeName: (context) => Profile()
    },
  ));
}
