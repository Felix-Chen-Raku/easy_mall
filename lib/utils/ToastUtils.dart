import 'package:flutter/material.dart';

class ToastUtils {
  static void showToast (BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      width: 120,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40)
      ),
      behavior: SnackBarBehavior.floating, // 悬浮状态
      duration: Duration(seconds: 2),
      content: Text(msg ?? '加载中',textAlign: TextAlign.center,)));
  }
}