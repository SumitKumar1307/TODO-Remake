// ignore_for_file: prefer_const_constructors

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
    Future<bool> flutterInitializationSuccessfull = initializeFlutter();
    return FutureBuilder<bool>(
        future: flutterInitializationSuccessfull,
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
