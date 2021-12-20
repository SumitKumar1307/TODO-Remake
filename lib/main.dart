// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_remake/methods.dart';
// import 'package:todo_remake/ui/home.dart';
import 'package:todo_remake/ui/registration.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future<bool> flutterInitialization_successfull = initializeFlutter();
    return FutureBuilder<bool>(
        future: flutterInitialization_successfull,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Something Went Wrong! :("),
            );
          }
          if (snapshot.hasData) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Registration(),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
  }
}
