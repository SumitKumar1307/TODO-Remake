// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_remake/methods.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Color(0xffCFEDFF),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Text(
                        "Lists",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: CircleAvatar(
                        radius: 27.5,
                        backgroundColor: Color(0xffCFEDFF),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ItemCard(title: "Shopping List"),
              SizedBox(height: 10),
              ItemCard(title: "TODO"),
              SizedBox(height: 35),
              Text(
                "Notes",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ItemCard(title: "Important Notes"),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  final String? title;
  ItemCard({Key? key, required this.title}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Color(0xffCFEDFF),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        "${widget.title}",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
