import 'package:easy_mall/models/home.dart';
import 'package:flutter/material.dart';

class EmCategory extends StatefulWidget {
  // 分类列表
  final List<CategoryItem> categoryList;
  EmCategory({Key? key, required this.categoryList}) : super(key: key);

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
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext context, int index){
          final category = widget.categoryList[index];
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: 80,
          height: 100,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 231, 232, 234),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(category.picture,width: 40, height: 40,),
              Text(category.name,style: TextStyle(color: Colors.black),), 
            ],
          ),
        );
      }),
    );
  }
}