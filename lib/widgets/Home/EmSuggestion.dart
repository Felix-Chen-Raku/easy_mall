import 'package:easy_mall/models/home.dart';
import 'package:flutter/material.dart';

class EmSuggestion extends StatefulWidget {
  final SpecialRecommendResult specialRecommendResult;
  EmSuggestion({Key? key, required this.specialRecommendResult}) : super(key: key);

  @override
  _EmSuggestionState createState() => _EmSuggestionState();
}

class _EmSuggestionState extends State<EmSuggestion> {

  // 取前三条数据
  List<GoodsItem> _getDisplayItems () {
    if(widget.specialRecommendResult.subTypes.isEmpty) return [];
    return widget.specialRecommendResult.subTypes.first.goodsItems.items.take(3).toList();
  }

  Widget _buildHeader () {
    return Row(
      children: [
        Text('特惠推荐',
          style: TextStyle(
            color: const Color.fromARGB(255, 86, 24, 20),
            fontSize: 18,
            fontWeight: FontWeight.w700),),
        SizedBox(width: 10,),
        Text('精选省攻略',
        style: TextStyle(
          color: const Color.fromARGB(255, 124, 63, 58)
        ),)
      ],
    );
  }

  Widget _buildLeft() {
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage('lib/assets/home_cmd_inner.png'),
        fit: BoxFit.cover)
      ),
    );
  }

  List<Widget> _getChildrenList (){
    List<GoodsItem> list = _getDisplayItems(); //取前3条数据
    return List.generate(list.length, (int index){
      return Column(
        children: [
          // 裁剪圆角
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              errorBuilder: (context, error, stackTrace) {
                return Image.asset('lib/assets/home_cmd_inner.png');
              },
              list[index].picture, 
              width: 100, 
              height: 140,
              fit: BoxFit.cover),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(255, 240, 96, 12)
            ),
            child: Text('￥${list[index].price}',style: TextStyle(color: Colors.white),),
          ),
        ]
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: AssetImage(
          'lib/assets/home_cmd_sm.png'
        ),
        fit: BoxFit.cover)
      ),
      alignment: Alignment.center,
      // height: 300,
      child: Column(
        children: [
          // 顶部区域
          _buildHeader (),
          SizedBox(height: 10,),
          Row(
            children: [
              _buildLeft(),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 均分空间
                children: _getChildrenList(),
              ))
            ],
          )
        ],
      ),
    ),
    );
  }
}