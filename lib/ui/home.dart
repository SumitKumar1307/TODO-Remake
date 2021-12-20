// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_remake/methods.dart';
import 'package:todo_remake/ui/registration.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CupertinoButton(
            child: Text(
              "Add Data",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: CupertinoColors.activeBlue,
            onPressed: () async {
              await addList("To-Do");
              await addItems([
                {"Completed": true, "Task": "Complete HomeWork"},
                {"Completed": false, "Task": "Play Fortnite"}
              ], "To-Do");
            },
          ),
        ),
      ),
    );
  }

  
}
