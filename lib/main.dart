import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_remake/ui/home.dart';
import 'package:todo_remake/ui/registration.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    var auth = FirebaseAuth.instance;
    print(auth.currentUser!.email);
    return MaterialApp(
      title: 'Flutter Demo',
      home: auth.currentUser == null ? Registration() : Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
