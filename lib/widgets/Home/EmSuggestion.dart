import 'package:flutter/material.dart';

class EmSuggestion extends StatefulWidget {
  EmSuggestion({Key? key}) : super(key: key);

  @override
  _EmSuggestionState createState() => _EmSuggestionState();
}

class _EmSuggestionState extends State<EmSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      height: 300,
      child: Text('推荐',style: TextStyle(color: Colors.white),),
    );
  }
}