// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_remake/ui/registration.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    final firestoreInstance = FirebaseFirestore.instance;
    if (currentUser == Null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Registration()),
          (Route<dynamic> route) => false);
    }

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

  Future<void> addList(String listName) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("data").doc(currentUser!.uid).update(
      {
        listName: {
          "type": "LIST",
          "items": FieldValue.arrayUnion(
            [],
          )
        }
      },
    );
  }

  Future<void> addItems(List<dynamic> items, String listName) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("data").doc(currentUser!.uid).update(
      {
        listName: {
          "items": FieldValue.arrayUnion(
            items,
          )
        }
      },
    );
  }

  Future<void> addNote(String title, String content) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    final firestoreInstance = FirebaseFirestore.instance;

    firestoreInstance.collection("data").doc(currentUser!.uid).update(
      {
        title: {
          "type": "NOTE",
          "content": content
        }
      },
    );
  }

  Future<void> updateNote(String title, String updatedContent) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    final firestoreInstance = FirebaseFirestore.instance;

    firestoreInstance.collection("data").doc(currentUser!.uid).update(
      {
        title: {
          "type": "NOTE",
          "content": updatedContent
        }
      },
    );
  }
}
