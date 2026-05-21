import 'package:easy_mall/models/home.dart';
import 'package:flutter/material.dart';

class EmHot extends StatefulWidget {
  final SpecialRecommendResult specialRecommendResult;
  final String type;
  EmHot({Key? key, required this.specialRecommendResult, required this.type}) : super(key: key);

  @override
  _EmHotState createState() => _EmHotState();
}

class _EmHotState extends State<EmHot> {

  // 获取前两条数据
  List<GoodsItem> _getItems(){
    if (widget.specialRecommendResult.subTypes.isEmpty) {
      return [];
    }
    return widget.specialRecommendResult.subTypes.first.goodsItems.items.take(2).toList();
  }

  List<Widget> _getChildrenList(){
    List<GoodsItem> list = _getItems();
    return List.generate(list.length, (int index){
      return Container(
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                list[index].picture,
                width: 80,
                height: 100,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'lib/assets/home_cmd_inner.png',
                    width: 80,
                    height: 100,
                  );
                },
                ),
            ),
            SizedBox(height: 5,),
            Text('￥${list[index].price}',style: TextStyle(fontSize: 12, color: const Color.fromARGB(255, 86, 24, 20)),)
          ],
        ),
      );
    });
  }

  Widget _buildHeader(){
    return Row(
      children: [
        Text(widget.type == 'step'?'一站买全':'爆款推荐',
        style: TextStyle(
          color: const Color.fromARGB(255, 86, 24, 20),
          fontSize: 18,
          fontWeight: FontWeight.w700
        ),),
        SizedBox(width: 10,),
        Text(widget.type == 'step'?'核心优选':'最受欢迎',
        style: TextStyle(
          color: const Color.fromARGB(255, 124, 63, 58),
          fontSize: 12,
          )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
      padding: EdgeInsets.all(12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: widget.type == 'step'
        ? const Color.fromARGB(255, 249, 247, 219)
        : const Color.fromARGB(255, 211, 228, 240)
      ),
       child: Column(
        children: [
          _buildHeader(),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _getChildrenList(),
          )
        ],
       ),
    ),
  );
    
  }
}