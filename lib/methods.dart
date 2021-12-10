import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      title: {"type": "NOTE", "content": content}
    },
  );
}

Future<void> updateNote(String title, String updatedContent) async {
  User? currentUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;

  firestoreInstance.collection("data").doc(currentUser!.uid).update(
    {
      title: {"type": "NOTE", "content": updatedContent}
    },
  );
}
