import 'package:flutter/material.dart';

class EmHot extends StatefulWidget {
  EmHot({Key? key}) : super(key: key);

  @override
  _EmHotState createState() => _EmHotState();
}

class _EmHotState extends State<EmHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 100,
      alignment: Alignment.center,
       child: Text('爆款推荐',style: TextStyle(color: Colors.white),),
    );
  }
}