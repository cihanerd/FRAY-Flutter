import 'package:dio/dio.dart';
import 'package:fraymobile/provider/auth_service.dart';

class ServiceBase {
  final String baseUrl = "https://api.test.f-rayscoring.com/";
  final Dio dio = new Dio();
  ServiceBase() {
    dio.options.baseUrl = "https://api.test.f-rayscoring.com/";
    dio.interceptors.clear();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        var token = await AuthService.getToken();
        options.headers["authorization"] = "Bearer $token";
        dio.options.headers['content-Type'] = 'application/json';
        handler.next(options);
      },
      onError: (e, handler) async {
        if (e.response!.statusCode == 401 || e.response!.statusCode == 403) {
          dio.interceptors.requestLock.lock();
          dio.interceptors.responseLock.lock();
          await AuthService.refreshToken();
          dio.interceptors.requestLock.unlock();
          dio.interceptors.responseLock.unlock();
          var response = await dio.fetch(e.requestOptions);
          handler.resolve(response);
        } else {
          handler.next(e);
        }
      },
    ));
  }
}
