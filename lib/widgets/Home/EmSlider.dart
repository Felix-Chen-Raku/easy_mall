import 'package:flutter/material.dart';

class EmSlider extends StatefulWidget {
  EmSlider({Key? key}) : super(key: key);

  @override
  _EmSliderState createState() => _EmSliderState();
}

class _EmSliderState extends State<EmSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 300,
      alignment: Alignment.center,
      child: Text('轮播图', style: TextStyle(color: Colors.white, fontSize: 20),),
    );
  }
}