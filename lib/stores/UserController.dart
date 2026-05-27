
import 'package:easy_mall/models/user.dart';
import 'package:get/get.dart';

// 需要共享的对象、属性，需要响应式
class UserController extends GetxController{
  var user = UserInfo.fromJSON({}).obs; // 数据需要响应式更新，要以.obs结尾
  // 取值需要用user.value
  updateUserInfo (UserInfo newUser) {
    user.value = newUser ;
  }
}