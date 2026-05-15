import 'package:easy_mall/constants/index.dart';
import 'package:easy_mall/models/home.dart';
import 'package:easy_mall/utils/DioRequest.dart';

// 封装处理获取轮播图接口
Future<List<BannerItem>> getBannerListAPI () async {
  // 返回请求
  final res = ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((item){
    return BannerItem.fromJSON(item as Map<String, dynamic>);
  }).toList();
  return res;
}

// 封装处理获取分类列表接口
Future<List<CategoryItem>> getCategoryListAPI () async {
  // 返回请求
  final res = ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((item){
    return CategoryItem.fromJson(item as Map<String, dynamic>);
  }).toList();
  return res;
}