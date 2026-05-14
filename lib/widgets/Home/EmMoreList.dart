import 'package:flutter/material.dart';

class EmMorelist extends StatefulWidget {
  EmMorelist({Key? key}) : super(key: key);

  @override
  _EmmorelistState createState() => _EmmorelistState();
}

class _EmmorelistState extends State<EmMorelist> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10), 
      itemBuilder: (BuildContext context ,int index){
        return Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text('商品',style: TextStyle(color: Colors.white),),
        );
      });
  }
}