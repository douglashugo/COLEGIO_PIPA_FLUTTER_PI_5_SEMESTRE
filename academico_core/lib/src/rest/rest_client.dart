import 'package:academico_core/src/rest/interceptiors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

final class RestClient extends DioForNative {
  RestClient(String utl)
      : super(
          BaseOptions(
            baseUrl: utl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
      AuthInterceptor(),
    ]);
  }
  RestClient get auth {
    options.extra['isAuth'] = true;
    return this;
  }

  RestClient get unAuth {
    options.extra['isAuth'] = false;
    return this;
  }
}
