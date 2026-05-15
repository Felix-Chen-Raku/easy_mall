import 'package:easy_mall/api/home.dart';
import 'package:easy_mall/models/home.dart';
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

  
  List<BannerItem> _bannerList = [
    // BannerItem(
    //   id: '1',
    //   imgUrl: 'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg'
    //   ),
    // BannerItem(
    //   id: '2',
    //   imgUrl: 'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png'
    //   ),
    // BannerItem(
    //   id: '3',
    //   imgUrl: 'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg'
    //   ),
  ];

  // 获取滚动组件
  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: EmSlider(bannerList: _bannerList,),), //轮播图组件
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannerList();
  }

  void _getBannerList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) { // sliver家族
    return CustomScrollView(
      slivers: _getScrollChildren(),
    ); 
  }
}