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

  Widget _getSlider (){ // 返回轮播图插件
  // 获取屏幕宽度
  final double screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider( // 轮播图插件 carousel_slider
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
        autoPlayAnimationDuration: Duration(seconds: 5), // 轮播时间
      ));
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _getSlider(),
      ],
    );
  }
}