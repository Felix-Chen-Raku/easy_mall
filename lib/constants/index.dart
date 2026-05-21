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
  static const String CATEGORY_LIST = '/home/category/head'; // 获取分类列表
  static const String PRODUCT_LIST = '/hot/preference'; // 获取特惠推荐
  static const String IN_VOGUE_LIST = '/hot/inVogue'; // 热榜推荐
  static const String ONE_STOP_LIST = '/hot/oneStop'; // 一站式推荐
  static const String RECOMMEND_LIST = '/home/recommend'; // 推荐列表
}