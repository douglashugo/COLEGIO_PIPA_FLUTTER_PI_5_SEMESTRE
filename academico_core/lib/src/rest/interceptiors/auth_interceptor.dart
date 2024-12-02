import 'package:academico_core/src/constants/local_storage_constants.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final RequestOptions(:headers, :extra) = options;
    const authHeaderKey = 'Authorization';
    if (extra case {'isAuth': true}) {
      final prefs = await SharedPreferences.getInstance();
      authHeaderKey:
      'Bearer ${prefs.getString(LocalStorageConstants.accessToken) ?? ''}';
    }

    handler.next(options);
  }
}
