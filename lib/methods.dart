import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

Future<bool> initializeFlutter() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  return true;
}

Future<dynamic> registerWithEmail(String email, String password) async {
  var auth = FirebaseAuth.instance;
  try {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    return 0;
  } on FirebaseAuthException catch (e) {
    if (e.code == "email-already-in-use") {
      return "Email is already in use!";
    } else if (e.code == "invalid-email") {
      return "Please provide a valid email!";
    } else if (e.code == "weak-password") {
      return "Please choose a stronger password!";
    }
  }
}

Future<dynamic> signInWithEmail(String email, String password) async {
  var auth = FirebaseAuth.instance;
  try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    return 0;
  } on FirebaseAuthException catch (e) {
    if (e.code == "user-disabled") {
      return "User account is disabled!";
    } else if (e.code == "invalid-email") {
      return "Please provide a valid email!";
    } else if (e.code == "user-not-found") {
      return "User not found!";
    } else if (e.code == "wrong-password") {
      return "Wrong Password!";
    }
  }
}

class AppObject {
  String? title;
  String? id;
  bool isSynced = false;

  void setID() {
    var uuid = const Uuid();
    id = uuid.v4();
  }
}

class ListObject extends AppObject {
  // [{"name": "Complete Homework", "item id": "0xFFGH123", "completed": true}]
  late Map<String, Map<String, dynamic>> items; 

  ListObject([String? title, Map<String, Map<String, dynamic>>? items]) {
    this.title = title ?? "";
    this.items = items ?? {};
    setID();
    createListInCloud();
  }

  Map<String, dynamic> toMap() => {
        "name": title,
        "items": items,
      };

  Future<void> syncList() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore cloud = FirebaseFirestore.instance;
    if (currentUser != null) {
      await cloud.collection("data").doc(currentUser.uid).update({
        "LIST": {
          id: toMap()
        }
      });
    }
    
    isSynced = true;
  }

  Future<void> createListInCloud() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore cloud = FirebaseFirestore.instance;
    if (currentUser != null) {
      await cloud.collection("data").doc(currentUser.uid).set({
        "LIST": {
          id: toMap()
        }
      });
    }
    
    isSynced = true;
  }
}

class NoteObject extends AppObject {
  late String content;

  NoteObject([String? title, String? content]) {
    this.title = title ?? "";
    this.content = content ?? "";
    setID();
    createNoteInCloud();
  }

  Map<String, dynamic> toMap() => {
        "name": title,
        "content": content,
      };

  Future<void> createNoteInCloud() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore cloud = FirebaseFirestore.instance;
    if (currentUser != null) {
      await cloud.collection("data").doc(currentUser.uid).set({
        "LIST": {
          toMap()["id"]: toMap()
        }
      });
    }
    
    isSynced = true;
  }

  Future<void> syncNote() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore cloud = FirebaseFirestore.instance;
    if (currentUser != null) {
      await cloud.collection("data").doc(currentUser.uid).update({
        "NOTES": {
          id: toMap()
        }
      });
    }
    
    isSynced = true;
  }
}
