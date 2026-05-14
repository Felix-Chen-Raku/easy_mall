import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_mall/models/home.dart';
import 'package:flutter/material.dart';

class EmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  EmSlider({Key? key,required this.bannerList}) : super(key: key);

  @override
  _EmSliderState createState() => _EmSliderState();
}

class _EmSliderState extends State<EmSlider> {

  // 返回轮播图插件
  Widget _getSlider (){ 
  // 获取屏幕宽度
    final double screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider( // 轮播图插件 carousel_slider
      carouselController: _controller,
      items: List.generate(widget.bannerList.length, (int index){
      return Image.network(widget.bannerList[index].imgUrl,
        fit: BoxFit.cover,
        width: screenWidth,
        );
    }), 
      options: CarouselOptions(
        viewportFraction: 1, // 屏幕占比
        height: 300, // 图片宽度
        autoPlay: true, // 自动播放
        autoPlayAnimationDuration: Duration(seconds: 3), // 轮播时间
        onPageChanged: (int index, reason) { //切换动作
          _currentIndex = index;
          setState(() {});
        },
      ));
  }

  // 搜索栏组件
  CarouselSliderController _controller = CarouselSliderController(); // 声明controller
  int _currentIndex =0;
  Widget _getSearch(){
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0,0,0,0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text('搜索...',style: TextStyle(color: Colors.white,fontSize: 16),),
        ),
        )
      );
  }

  // 返回指示灯
  Widget _getDots(){
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (int index){
            return GestureDetector(
              onTap: () {
                _controller.jumpToPage(index);
              },
            child:AnimatedContainer( //动画
              duration: Duration(microseconds: 800),
              height: 6,
              width: index == _currentIndex ? 40 : 20,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: index == _currentIndex ? Colors.white : Color.fromRGBO(0, 0, 0, 0.3),
                borderRadius: BorderRadius.circular(3),
              ),
            )
            );
          }),
        ),
        )
      );
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _getSlider(),
        _getSearch(),
        _getDots()
      ],
    );
  }
}