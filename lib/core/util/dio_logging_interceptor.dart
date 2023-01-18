import 'package:dio/dio.dart';
import 'package:pokemon/config/base_url_config.dart';

import 'shared_preferences_manager.dart';

class DioLoggingInterceptor extends InterceptorsWrapper {
  final Dio _dio;
  final SharedPreferencesManager _sharedPreferencesManager;

  DioLoggingInterceptor(this._dio, this._sharedPreferencesManager);

  var isRefreshTokenProcessing = false;

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print('--> ${options.method.toUpperCase()} ${options.baseUrl + options.path}');
    // print('Headers:');
    // options.headers.forEach((k, v) => print('$k: $v'));
    // print('queryParameters:');
    // options.queryParameters.forEach((k, v) => print('$k: $v'));
    // if (options.data != null) {
    //   print('Body: ${options.data}');
    // }
    // print('--> END ${options.method.toUpperCase()}');

    var defaultLanguageCode = _sharedPreferencesManager.getString(
      SharedPreferencesManager.keyDefaultLanguageCode,
      defaultValue: SharedPreferencesManager.keyLanguageIndonesiaCode,
    );
    options.headers.addAll({'x-localization': defaultLanguageCode});
    if (options.headers.containsKey(BaseUrlConfig.download)) {
      options.headers.remove(BaseUrlConfig.download);
    } else {
      options.headers.addAll({'Accept': 'application/json'});
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('<-- ${response.statusCode} ${response.requestOptions.baseUrl + response.requestOptions.path}');
    // print('Headers:');
    // response.headers.forEach((k, v) => print('$k: $v'));
    // print('Response: ${response.data}');
    // print('<-- END HTTP');
    handler.next(response);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    print(
        '<-- ${err.message} ${(err.response?.requestOptions != null ? ((err.response?.requestOptions.baseUrl ?? '') + (err.response?.requestOptions.path ?? '')) : 'URL')}');
    // print('${err.response != null ? err.response?.data : 'Unknown Error'}');
    // print('${err.response != null ? err.response?.headers : 'Unknown Error'}');
    // print('<-- End error');

    var responseCode = err.response?.statusCode;
    if (isRefreshTokenProcessing && err.response != null) {
      await Future.delayed(const Duration(seconds: 2));
      final options = err.response!.requestOptions;
      options.headers.addAll({'requiredtoken': true});
      final response = await _dio.fetch(options);
      return handler.resolve(response);
    }
    if (responseCode == 302) {
      if (err.response != null && err.response!.headers.map['location'] != null) {
        final newUrl =
            err.response!.headers.map['location']!.isNotEmpty ? err.response!.headers.map['location']!.first : '';
        try {
          final response = await _dio.get(
            newUrl,
            options: Options(
              headers: {
                BaseUrlConfig.requiredToken: true,
              },
            ),
          );
          return handler.resolve(response);
        } on DioError catch (error) {
          return handler.next(error);
        }
      }
    }
  }
}
