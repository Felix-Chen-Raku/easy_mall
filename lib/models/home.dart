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

// 分类class和工厂转化函数
class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;

  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'],
      name: json['name'],
      picture: json['picture'],
      children: json['children'] == null
          ? []
          : (json['children'] as List).map((e) => CategoryItem.fromJson(e)).toList(),
    );
  }
}