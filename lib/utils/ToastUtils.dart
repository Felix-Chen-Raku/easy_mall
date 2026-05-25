import 'package:flutter/material.dart';

class ToastUtils {
  // 阀门控制
  static bool shoeLoading = false;
  static void showToast (BuildContext context, String msg) {
    if (ToastUtils.shoeLoading) {
      return;
    }
    ToastUtils.shoeLoading = true;
    Future.delayed(Duration(seconds: 3),(){
      ToastUtils.shoeLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      width: 180,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40)
      ),
      behavior: SnackBarBehavior.floating, // 悬浮状态
      duration: Duration(seconds: 3),
      content: Text(msg ?? '加载中',textAlign: TextAlign.center,)));
  }
}