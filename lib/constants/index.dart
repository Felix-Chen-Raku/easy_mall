// 全局常量
class GlobalConstants {
  // static 修饰静态属性，取用可以直接用 GlobalConstans.***
  // const 不变量
  static const String BASE_URL = 'https://meikou-api.itheima.net'; // 基础地址
  static const int TIME_OUT = 10; // 超时时间
  static const String SUCCESS_CODE = '1'; // 成功状态
}

// 请求地址接口常量
class HttpConstants {
  static const String BANNER_LIST = '/home/banner'; // 获取轮播图
}