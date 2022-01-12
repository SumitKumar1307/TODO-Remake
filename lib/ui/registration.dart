// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_remake/methods.dart';
import 'package:todo_remake/ui/home.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    List signInOptions = [
      {
        "title": "Sign In With Email",
        "icon": Icon(Icons.email_outlined, color: Colors.black),
        "method": "email"
      },
      {
        "title": "Sign In With Microsoft",
        "icon": Icon(FontAwesomeIcons.microsoft, color: Colors.black),
        "method": "ms"
      },
      {
        "title": "Sign In With Google",
        "icon": Icon(FontAwesomeIcons.google, color: Colors.black),
        "method": "google"
      }
    ];

    List registerOptions = [
      {
        "title": "Register With Email",
        "icon": Icon(Icons.email_outlined, color: Colors.black),
        "method": "email"
      },
      {
        "title": "Register With Microsoft",
        "icon": Icon(FontAwesomeIcons.microsoft, color: Colors.black),
        "method": "ms"
      },
      {
        "title": "Register With Google",
        "icon": Icon(FontAwesomeIcons.google, color: Colors.black),
        "method": "google"
      }
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 100),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                for (var i = 0; i < signInOptions.length; i++)
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 70,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(19)),
                      color: Color(0xffF4F9FC),
                    ),
                    margin: EdgeInsets.only(top: 10),
                    child: MaterialButton(
                      onPressed: () => {
                        if (signInOptions[i]["method"] == "email")
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Form(registerOrSignIn: 1),
                              ),
                            )
                          }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            signInOptions[i]['title'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          signInOptions[i]["icon"]
                        ],
                      ),
                    ),
                  ),
                SizedBox(height: 45),
                Text(
                  "Register In",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                for (var i = 0; i < registerOptions.length; i++)
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 70,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(19)),
                      color: Color(0xffF4F9FC),
                    ),
                    margin: EdgeInsets.only(top: 10),
                    child: MaterialButton(
                      onPressed: () => {
                        if (registerOptions[i]["method"] == "email")
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Form(registerOrSignIn: 0),
                              ),
                            )
                          }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            registerOptions[i]["title"],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          registerOptions[i]["icon"]
                        ],
                      ),
                    ),
                  ),
                SizedBox(
                  height: 75,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Form extends StatefulWidget {
  final int? registerOrSignIn; // 0 if register, else 1
  const Form({Key? key, @required this.registerOrSignIn}) : super(key: key);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String email_error = "";
  String pass_error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 150),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  widget.registerOrSignIn == 0 ? "Register" : "Sign In",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
                if (email_error != "")
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      email_error,
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                Container(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xffF4F9FC),
                  ),
                  child: CupertinoTextField(
                    decoration: BoxDecoration(color: Colors.transparent),
                    controller: email,
                    placeholder: "example@email.com",
                    prefix: Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Icon(Icons.email_outlined, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xffF4F9FC),
                  ),
                  child: CupertinoTextField(
                    decoration: BoxDecoration(color: Colors.transparent),
                    controller: password,
                    placeholder: "password",
                    prefix: Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Icon(Icons.lock_outline, color: Colors.black),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffCFEDFF),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: CupertinoButton(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 90, right: 90),
                    child: Text(
                      widget.registerOrSignIn == 0 ? "Register" : "Sign In",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () async {
                      // * If we need to create a new user
                      if (widget.registerOrSignIn == 0) {
                        var result =
                            await registerWithEmail(email.text, password.text);
                        if (result == 0) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => Home()),
                              (Route<dynamic> route) => false);
                        } else {
                          setState(() {
                            email_error = result as String;
                          });
                        }
                      }
                      // * if the user already exists
                      else {
                        var result =
                            await signInWithEmail(email.text, password.text);
                        if (result == 0) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => Home()),
                              (Route<dynamic> route) => false);
                        } else {
                          setState(() {
                            email_error = result as String;
                          });
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
