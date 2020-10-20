import 'package:dio/dio.dart';

class ApiConfig {

  String _url = "https://uapi-mpsp.azurewebsites.net/api/";
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
          request.headers["Authorization"] = "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6WyJnZ29tZXMiLCJnZ29tZXMiXSwianRpIjoiNWQ5NWJkNjY0ZjM5NDA5MmI4OWExZWU5YTBlOTg1MzUiLCJuYmYiOjE2MDMxNjM4MzEsImV4cCI6MTYwMzE2NzQzMSwiaWF0IjoxNjAzMTYzODMxLCJpc3MiOiJuTGF1ZG8iLCJhdWQiOiJuTGF1ZG8ifQ.jFNs6e66pSBtDlve25wyXw2wOcqY_r6-m5PGwq5LnfGhXnYRv2PrWIdIYkftYcv-6bi2yHSrOHSN0_Yom6L0qjCElBO_ErftZxmgcMdTjPWelaG1ob6OOOpEl3YsczZnReUKAKeGwrAsoxpPTRZQ7_z7WsurO-UWpYB-3H2TsVj0oZ9aN1mLW2tC1AiY5VcqCpEM5jfvPP5I710MPINcTj7qv31K-Pzbp9EV7Z8dqntC3qJP_5QTsVigQOJNMwyb3GeCib3AO_ed9VUKb6Qvr_-KMgw0cvBsA1USlBzHquq2blzTCNFCCDOhCiVZaxGbWxosWMqs7M6Z0vg2YL54nw";
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
