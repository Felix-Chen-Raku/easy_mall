// 每一个轮播图的类型
class BannerItem { // 类型更加明确
  String id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});

  // 扩展工厂函数，用来创建实例对象
  factory BannerItem.fromJSON(Map<String, dynamic> json){
    return BannerItem(
      id: json['id'] ?? '', 
      imgUrl: json['imgUrl'] ?? ''
      );
  }
}

