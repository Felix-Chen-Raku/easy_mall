import 'package:easy_mall/api/user.dart';
import 'package:easy_mall/pages/Cart/index.dart';
import 'package:easy_mall/pages/Category/index.dart';
import 'package:easy_mall/pages/Home/index.dart';
import 'package:easy_mall/pages/My/index.dart';
import 'package:easy_mall/stores/TokenManager.dart';
import 'package:easy_mall/stores/UserController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 定义数据 根据数据进行渲染4个导航
  final List<Map<String, String>> _tabList = [
    {
      'icon':'lib/assets/ic_public_home_normal.png',
      'active_icon':'lib/assets/ic_public_home_active.png',
      'text':'首页',
      },
    {
      'icon':'lib/assets/ic_public_pro_normal.png',
      'active_icon':'lib/assets/ic_public_pro_active.png',
      'text':'分类',
      },
    {
      'icon':'lib/assets/ic_public_cart_normal.png',
      'active_icon':'lib/assets/ic_public_cart_active.png',
      'text':'购物车',
      },
    {
      'icon':'lib/assets/ic_public_my_normal.png',
      'active_icon':'lib/assets/ic_public_my_active.png',
      'text':'我的',
      },
  ];
  int _currentIndex = 0;

  // 返回底部渲染的四个分类
  List<BottomNavigationBarItem> _getTabBarWidget(){
    return List.generate(_tabList.length, (int index){
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]['icon']!,
        width: 30,
        height: 30,
        ),
        activeIcon: Image.asset(_tabList[index]['active_icon']!,
        width: 30,
        height: 30,
        ),
        label: _tabList[index]['text'],
        );
    });
  }

  // 返回四个页面
  List<Widget> _getChildren(){
    return [HomeView(), CategoryView(), CartView(), MyView()];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化用户
    _initUser();
  }
  final UserController _userController = Get.put(UserController());
  _initUser() async {
    await tokenManager.init(); // 先初始化token
    if (tokenManager.getToken().isNotEmpty) {
      // 有token就获取用户信息
      _userController.updateUserInfo(await getUserInfoAPI());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // 避开安全区
        child: IndexedStack( // 堆叠索引组件
          index: _currentIndex,
          children: _getChildren(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 底部tap图标不移动
        showUnselectedLabels: true, // 显示没有选中的label
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        onTap: (int index) {
          _currentIndex = index;
          setState(() {});
        },
        currentIndex: _currentIndex,
        items: _getTabBarWidget()),
    );
  }
}