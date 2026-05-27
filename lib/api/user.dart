import 'package:easy_mall/constants/index.dart';
import 'package:easy_mall/models/user.dart';
import 'package:easy_mall/utils/DioRequest.dart';

// 登录接口
Future<UserInfo> loginAPI (Map<String, dynamic> data) async {
  return UserInfo.fromJSON(
    await dioRequest.post(HttpConstants.LOGIN, data: data),
  );
}

// 获取用户信息接口
Future<UserInfo> getUserInfoAPI() async {
  return UserInfo.fromJSON(
    await dioRequest.get(HttpConstants.USER_PROFILE)
  );
}