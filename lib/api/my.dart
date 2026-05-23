import 'package:easy_mall/constants/index.dart';
import 'package:easy_mall/models/home.dart';
import 'package:easy_mall/utils/DioRequest.dart';

// 猜你喜欢接口
Future<GoodsDetailItems> getGuessListAPI (Map<String, dynamic> params) async {
  return GoodsDetailItems.fromJson(
    await dioRequest.get(HttpConstants.GUESS_LIST, params: params)
    );
}