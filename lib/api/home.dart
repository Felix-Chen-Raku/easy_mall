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

// 封装处理获取特惠推荐接口
Future<SpecialRecommendResult> getSpecialRecommendAPI () async {
  // 返回请求
  final res = SpecialRecommendResult.fromJson(await dioRequest.get(HttpConstants.PRODUCT_LIST));
  return res;
}

// 封装处理热搜推荐
Future<SpecialRecommendResult> getInVogueListAPI () async {
  // 返回请求
  return SpecialRecommendResult.fromJson(await dioRequest.get(HttpConstants.IN_VOGUE_LIST));
}

// 封装处理一站式推荐
Future<SpecialRecommendResult> getONeStopListAPI () async {
  // 返回请求
  return SpecialRecommendResult.fromJson(await dioRequest.get(HttpConstants.ONE_STOP_LIST));
}