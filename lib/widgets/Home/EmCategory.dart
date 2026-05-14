import 'package:flutter/material.dart';

class EmCategory extends StatefulWidget {
  EmCategory({Key? key}) : super(key: key);

  @override
  _EmCategoryState createState() => _EmCategoryState();
}

class _EmCategoryState extends State<EmCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index){
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: 80,
          height: 100,
          color: Colors.blue,
          child: Text('分类${index + 1}',style: TextStyle(color: Colors.white),),
        );
      }),
    );
  }
}