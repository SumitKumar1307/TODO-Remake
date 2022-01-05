import 'package:flutter/material.dart';

class HomeMain extends StatefulWidget {
  final String? text;
  final Function? onClick;
  const HomeMain({Key? key, @required this.text, this.onClick}) : super(key: key);

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}