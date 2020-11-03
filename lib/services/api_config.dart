import 'package:dio/dio.dart';

class ApiConfig {

  static final String url = "https://uapi-mpsp.azurewebsites.net/api/";
  static String _token;
  int timeout = 5000;

  ApiConfig( {this.timeout = 5000} );

  static void setToken(String token) {
    ApiConfig._token = "Bearer ${token}";
  }

  static String getToken() {
    return ApiConfig._token;
  }

  Dio create() {
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: timeout,
        baseUrl: url,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions request) async {
          request.headers["Authorization"] = _token;
          return request;
        },
        onResponse: (Response response) async {
          // decript
          return response;
        },
        onError: (DioError error) async {
          return error;
        },
      ),
    );

    return dio;
  }
}
