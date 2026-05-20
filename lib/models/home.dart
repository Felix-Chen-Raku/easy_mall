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

// 特惠推荐系列class
class GoodsItem {
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory GoodsItem.fromJson(Map<String, dynamic> json) {
    return GoodsItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      desc: json['desc'],
      price: json['price'] ?? '',
      picture: json['picture'] ?? '',
      orderNum: json['orderNum'] ?? 0,
    );
  }
}

class GoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodsItem> items;

  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodsItems.fromJson(Map<String, dynamic> json) {
    return GoodsItems(
      counts: json['counts'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      pages: json['pages'] ?? 0,
      page: json['page'] ?? 1,
      items: (json['items'] as List?)?.map((e) => GoodsItem.fromJson(e)).toList() ?? [],
    );
  }
}

class SubType {
  String id;
  String title;
  GoodsItems goodsItems;

  SubType({
    required this.id,
    required this.title,
    required this.goodsItems,
  });

  factory SubType.fromJson(Map<String, dynamic> json) {
    return SubType(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      goodsItems: GoodsItems.fromJson(json['goodsItems'] ?? {}),
    );
  }
}

class SpecialRecommendResult {
  String id;
  String title;
  List<SubType> subTypes;

  SpecialRecommendResult({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  factory SpecialRecommendResult.fromJson(Map<String, dynamic> json) {
    return SpecialRecommendResult(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      subTypes: (json['subTypes'] as List?)?.map((e) => SubType.fromJson(e as Map<String, dynamic>)).toList() ?? [],
    );
  }
}