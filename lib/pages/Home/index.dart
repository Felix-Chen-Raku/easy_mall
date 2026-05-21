import 'package:easy_mall/api/home.dart';
import 'package:easy_mall/models/home.dart';
import 'package:easy_mall/utils/ToastUtils.dart';
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
  List<CategoryItem> _categoryList = [];
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
      SliverToBoxAdapter(child: EmCategory(categoryList: _categoryList,),), // 分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      SliverToBoxAdapter(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: EmSuggestion(specialRecommendResult: _specialRecommendResult,),),), // 推荐组件
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      SliverToBoxAdapter(child: Padding(
        padding:EdgeInsets.symmetric(horizontal: 10),
        child: 
        Flex( // 可控制分配比例
        direction: Axis.horizontal,
        children: [
          Expanded(child: EmHot(specialRecommendResult: _inVogueResult, type: 'hot',)),
          SizedBox(width: 10,),
          Expanded(child: EmHot(specialRecommendResult: _oneStopResult, type: 'step',)),
        ],))),
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      EmMorelist(recommendList: _recommendList,),
    ];
  }

  // 特惠推荐组件
  SpecialRecommendResult _specialRecommendResult = SpecialRecommendResult(
    id: '',
    title: '',
    subTypes: [],
  );

  // 热榜推荐组件
  SpecialRecommendResult _inVogueResult = SpecialRecommendResult(
    id: '', 
    title: '', 
    subTypes: []
  );

  // 一站式推荐组件
  SpecialRecommendResult _oneStopResult = SpecialRecommendResult(
    id: '', 
    title: '', 
    subTypes: []
  );

  // 推荐列表
  List<GoodDetailItem> _recommendList = [];

  int _page = 1; // 页码
  bool _isLoading = false; // 当前正在加载中
  bool _hasMore = true; // 是否还有下一页

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getBannerList();
    // _getCategoryList();
    // _getSpecialRecommend();
    // _getInVogueList();
    // _getOnetStopList();
    // _getRecommendList();
    _registerEvent();
    // initState => build => 下拉刷新组件 => 可操作
    Future.microtask((){
      _paddingTop = 100;
      setState(() {});
      _key.currentState?.show();
    });
  }

  // 获取推荐列表
  Future<void> _getRecommendList() async {
    // 已有请求/没有下一页，放弃请求
    if (_isLoading || !_hasMore) {
      return;
    }
    _isLoading = true; // 占住位置
    int requestLimit = _page * 10;
    _recommendList = await getRecommendListAPI({'limit': requestLimit}); // limit: 请求数量
    _isLoading = false; // 释放位置
    setState(() {});
    if (_recommendList.length < requestLimit) {
      _hasMore = false;
      return ;
    }
    _page += 1;
  }

  // 获取热榜推荐
  Future<void> _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    // setState(() {});
  }

  // 获取一站式推荐
  Future<void> _getOnetStopList() async {
    _oneStopResult = await getONeStopListAPI();
    // setState(() {});
  }

  // 监听滚动到底部的事件
  void _registerEvent() {
    _controller.addListener((){
      if (_controller.position.pixels >= // ==可能直接滑过，不会触发
      _controller.position.maxScrollExtent - 50) {
        // 加载下一页数据
        _getRecommendList();
      }
    }); 
  }

  // 获取特惠推荐
  Future<void> _getSpecialRecommend() async {
    _specialRecommendResult = await getSpecialRecommendAPI();
    // setState(() {});
  }

  // 获取分类列表
  Future<void> _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    // setState(() {});
  }
  // 获取轮播图
  Future<void> _getBannerList() async {
    _bannerList = await getBannerListAPI();
    // setState(() {});
  }

  Future<void> _onRefresh() async {
    _page = 1;
    _isLoading = false;
    _hasMore = true;
    await _getBannerList();
    await _getCategoryList();
    await _getSpecialRecommend();
    await _getInVogueList();
    await _getOnetStopList();
    await _getRecommendList();
    // 数据获取成功，刷新成功
    ToastUtils.showToast(context, '刷新成功');
    _paddingTop = 0;
    setState(() {});
  }
  final ScrollController _controller = ScrollController();

  // GlobalKey是一个方法，可以创建一个key绑定到Widget部件上，可以操作Widget
  final GlobalKey<RefreshIndicatorState> _key = GlobalKey<RefreshIndicatorState>();
  double _paddingTop = 0;
  @override
  Widget build(BuildContext context) { // sliver家族
    // 包裹子组件，下拉触发onRefresh函数
    return RefreshIndicator(
      key: _key,
      onRefresh: _onRefresh,
      child: AnimatedContainer(
        padding: EdgeInsets.only(top: _paddingTop),
        duration: Duration(microseconds: 300),
        child: CustomScrollView(
      controller: _controller, // 绑定控制器
      slivers: _getScrollChildren(),
    ),
        )
    ); 
  }
}