import 'package:dio/dio.dart';

class ApiConfig {

  String _url = "https://uapi-mpsp.azurewebsites.net:44362/api/";
  int timeout = 5000;

  ApiConfig( {this.timeout = 5000} );


  Dio create() {
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: timeout,
        baseUrl: _url,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions request) async {
          request.headers["token"] = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6WyJnZ29tZXMiLCJnZ29tZXMiXSwianRpIjoiOTNmNTk3OWUzYTVkNDBjMmJiMTQxNzc0NWY4Yjg0OTgiLCJuYmYiOjE2MDMxNTQ2MTUsImV4cCI6MTYwMzE1ODIxNSwiaWF0IjoxNjAzMTU0NjE1LCJpc3MiOiJuTGF1ZG8iLCJhdWQiOiJuTGF1ZG8ifQ.c7ZcnpPpS4PfDH1u40eetdJ7yy0WxCudfh6HsTSFySuGtqA9BO2-ps0sBzteuxl4QbmXTe6hFPBPjbK9cwqS5AFTD6CQ2-TdrIoi4qCF8zZ_ZAipoXoWeWJjCGzBmgdvUOFrfGONDQ0ihHtJSW5OctMK9Ub2sgWf-gGNrpPdpsgXiseF_9A6WjHKGvlKEEIc9ovnnWWl8D4vq2VfmECKZ8DmjNuwjwq4Sbc9OSUt9Yx-qjyKtpDycH0oWoEFONS75Lu6ONlFrtSozPLqOLac2GcxD8zSG9Al8cDqevj0MREh3JuJjMcuU1hsinJ_brzxeBIxw06HMX8zH50vURKNGg";
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
