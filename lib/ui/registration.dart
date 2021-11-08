// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        "icon": Icon(Icons.email_outlined, color: Colors.black)
      },
      {
        "title": "Sign In With Microsoft",
        "icon": Icon(FontAwesomeIcons.microsoft, color: Colors.black)
      },
      {
        "title": "Sign In With Google",
        "icon": Icon(FontAwesomeIcons.google, color: Colors.black)
      }
    ];

    List registerOptions = [
      {
        "title": "Register With Email",
        "icon": Icon(Icons.email_outlined, color: Colors.black)
      },
      {
        "title": "Register With Microsoft",
        "icon": Icon(FontAwesomeIcons.microsoft, color: Colors.black)
      },
      {
        "title": "Register With Google",
        "icon": Icon(FontAwesomeIcons.google, color: Colors.black)
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
