import 'package:easy_mall/models/home.dart';
import 'package:flutter/material.dart';

class EmMorelist extends StatefulWidget {
  final List<GoodDetailItem> recommendList;
  EmMorelist({Key? key, required this.recommendList}) : super(key: key);

  @override
  _EmmorelistState createState() => _EmmorelistState();
}

class _EmmorelistState extends State<EmMorelist> {

  Widget _getChildrenList(int index){
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio( // 宽高比组件
              aspectRatio: 1.0,
              child: Image.network(widget.recommendList[index].picture,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'lib/assets/home_cmd_inner.png',
                  fit: BoxFit.cover,
                );
              },),
              ),
          ),
          SizedBox(height: 6,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.recommendList[index].name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20
              ),
            ),
            ),
            SizedBox(height: 6,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(
                    text: '￥${widget.recommendList[index].price}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                    ),
                    children: [
                      TextSpan(text: ' '),
                      TextSpan(
                        text: '${widget.recommendList[index].price}',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 12
                        )
                        )
                    ]
                  )),
                  Text(
                    '${widget.recommendList[index].paycount}人付款',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),)
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: widget.recommendList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.75
        ), 
      itemBuilder: (BuildContext context ,int index){
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: _getChildrenList(index),
        );
      });
  }
}