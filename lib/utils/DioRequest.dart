// 基于DIo进行二次封装
import 'package:dio/dio.dart';
import 'package:easy_mall/constants/index.dart';

class Diorequest {
  final _dio = Dio(); // dio请求对象
  // 基础地址拦截器
  Diorequest(){
    _dio.options
      ..baseUrl = GlobalConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
      // 拦截器
      _addInterceptor();
  }
  void _addInterceptor (){
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler){
          handler.next(request);
        },
        onResponse: (response, handler){
          if (response.statusCode! >= 200 && response.statusCode! <= 300){
            handler.next(response);
            return;
          }
          handler.reject(DioException(requestOptions: response.requestOptions));
        } ,
        onError: (error, handler){
          // handler.reject(error);
          handler.reject(DioException(
            requestOptions: error.requestOptions,
            message: error.response?.data['msg'] ?? ' '
            ));
        }
      )
    );
  }

  Future<dynamic> get (String url, {Map<String, dynamic>? params}) {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

  Future<dynamic> post (String url, {Map<String, dynamic>? data}) {
    return _handleResponse(_dio.post(url, data: data));
  }

  // 进一步处理返回结果
  _handleResponse(Future<Response<dynamic>> task) async {
    try {
      Response<dynamic> res = await task;
    final data = res.data as Map<String, dynamic>; // data为接口真实返回数据
    // 根据code判断是否成功
    if (data['code'] == GlobalConstants.SUCCESS_CODE) {
      return data['result'];
    }
    // 抛出异常
    // throw Exception(data['msg'] ?? '加载数据异常');
    throw DioException(
      requestOptions: res.requestOptions,
      message: data['msg'] ?? '加载数据失败',
      );
    } catch (e) {
      // throw Exception(e);
      rethrow; // 不改变原异常类型
    }
  }

}

// 单例对象
final dioRequest = Diorequest(); 