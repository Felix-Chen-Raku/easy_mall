import 'package:easy_mall/widgets/Home/EmCategory.dart';
import 'package:easy_mall/widgets/Home/EmHot.dart';
import 'package:easy_mall/widgets/Home/EmMoreList.dart';
import 'package:easy_mall/widgets/Home/EmSlider.dart';
import 'package:easy_mall/widgets/Home/EmSuggestion.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 获取滚动组件
  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: EmSlider(),), //轮播图组件
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      SliverToBoxAdapter(child: EmCategory(),), // 分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      SliverToBoxAdapter(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: EmSuggestion(),),), // 推荐组件
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      SliverToBoxAdapter(child: Padding(
        padding:EdgeInsets.symmetric(horizontal: 10),
        child: 
        Flex( // 可控制分配比例
        direction: Axis.horizontal,
        children: [
          Expanded(child: EmHot()),
          SizedBox(width: 10,),
          Expanded(child: EmHot()),
        ],))),
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      EmMorelist(),
    ];
  }
  @override
  Widget build(BuildContext context) { // sliver家族
    return CustomScrollView(
      slivers: _getScrollChildren(),
    ); 
  }
}