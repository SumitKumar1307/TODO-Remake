// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_remake/methods.dart';
import 'package:uuid/uuid.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  List<ListItem> _children = [];
  Map<int, String> listItems = {};
  int index = 1;
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create",
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text("Name"),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 47,
                        padding: EdgeInsets.only(left: 15),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color(0xFFF4F9FC),
                            border: Border.all(color: Colors.black, width: 2)),
                        child: CupertinoTextField(
                          placeholder: "item name",
                          decoration: BoxDecoration(color: Colors.transparent),
                          controller: name,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Items"),
                      ListItem(listItems: listItems, index: 0),
                      for (ListItem i in _children) i,
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.325,
                            height: 47,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xFFF4F9FC),
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: SizedBox(
                              height: 47,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _children.add(ListItem(
                                          listItems: listItems, index: index));
                                      index++;
                                    });
                                  },
                                  icon: Icon(Icons.add)),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.325,
                            height: 47,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xFFF4F9FC),
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: SizedBox(
                              height: 47,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: IconButton(
                                  onPressed: () {
                                    print(listItems);
                                    setState(() {
                                      _children.removeLast();
                                      listItems[index - 1] = "";
                                      index--;
                                    });
                                  },
                                  icon: Icon(Icons.remove)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: CupertinoColors.activeBlue,
                  margin: EdgeInsets.only(bottom: 30, top: 30),
                  child: CupertinoButton(child: Text("CREATE"), onPressed: () async {
                    var uuid = Uuid();
                    ListObject list = ListObject();
                    Map items = {};
                    listItems.forEach((key, value) {
                      items[uuid.v4()] = {"name": value};
                      print(items);
                     });
                    list.title = name.text;
                    list.items = items;    
                    list.setID();
                    await list.createListInCloud();
                    await list.syncList();                
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListItem extends StatefulWidget {
  Map<int, String> listItems;
  int index;
  ListItem({Key? key, required this.listItems, required this.index})
      : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  TextEditingController textEditingController = TextEditingController();
  bool? checkBox = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 15,
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 47,
            padding: EdgeInsets.only(left: 15),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFFF4F9FC),
                border: Border.all(color: Colors.black, width: 2)),
            child: CupertinoTextField(
              placeholder: "item name",
              decoration: BoxDecoration(color: Colors.transparent),
              controller: textEditingController,
              onChanged: (value) {
                widget.listItems[widget.index] = textEditingController.text;
              },
            ),
          ),
          SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF4F9FC),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            width: 47,
            height: 47,
            child: FittedBox(
              child: Checkbox(
                value: checkBox,
                onChanged: (newValue) {
                  setState(() {
                    checkBox = newValue;
                  });
                },
                side: BorderSide.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
