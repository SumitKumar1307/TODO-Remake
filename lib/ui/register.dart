// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 130),
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
                SizedBox(height: 40),
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
                    children: const [
                      Text(
                        "Sign In With Email",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
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
                    children: const [
                      Text(
                        "Sign In With Microsoft",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
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
                    children: const [
                      Text(
                        "Sign In With Google",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      )
                    ],
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
