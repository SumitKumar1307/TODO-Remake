// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:todo_remake/methods.dart';
import 'package:uuid/uuid.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    String greeting = "Hello!";
    if (DateTime.now().hour < 12) {
      greeting = "Good\nMorning!";
    } else if (DateTime.now().hour < 17) {
      greeting = "Good\nAfternoon!";
    } else {
      greeting = "Good\nEvening!";
    }

    var uuid = Uuid();
    DataRetriever dataRetriever = DataRetriever();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ListObject retriever = ListObject("TODO", {
            uuid.v4(): {"name": "Complete Homework", "complete": false},
            uuid.v4(): {"name": "Play Fortnite", "complete": true},
          });
          await retriever.syncList();
          setState(() {});
        },
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Color(0xffCFEDFF),
      ),
      body: SafeArea(
        child: FutureBuilder<dynamic>(
          future: dataRetriever.retrieveLists(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Text("Something went wrong!"),
              );
            }
            if (snapshot.hasData && snapshot.data != null) {
              dynamic data = snapshot.data;
              List lists = [];
              if (data is Map) {
                data.forEach((key, element) {
                  lists.add({"name": element["name"], "id": key});
                });
              } else {
                return Center(
                    child: Text(
                        "Oops! Looks like they are no lists or notes for your account."));
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 30, left: 20),
                      alignment: Alignment.bottomLeft,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        color: Color(0xffCFEDFF),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: Text(
                        greeting,
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          for (var i in lists)
                            Column(children: [
                              ItemCard(title: i["name"]),
                              SizedBox(height: 10)
                            ]),
                          SizedBox(height: 25),
                          Text(
                            "Notes",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          ItemCard(title: "Important Notes")
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  final String? title;
  const ItemCard({Key? key, required this.title}) : super(key: key);

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
          fontFamily: 'Roboto',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
