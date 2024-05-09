
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

class HttpClient {
  late Dio client;
  late Dio retryClient;

  HttpClient() {
    client = Dio(BaseOptions(
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
    ));
    client.interceptors.add(_interceptor());
    client.interceptors.add(RetryInterceptor(
      dio: client,
      retries: 1,
      retryDelays: const [
        Duration(seconds: 30),
      ],
    ));

    retryClient = Dio(BaseOptions(
      receiveTimeout: const Duration(seconds: 10),
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
    ));
  }

  Interceptor _interceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        int diffSecond = 0;
        // final expir = await TokenStorage().getExpir();
        // if (expir != null) {
        //   try {
        //     final expirTime = DateTime.parse(expir);
        //     final now = DateTime.now();
        //     diffSecond = expirTime.difference(now).inSeconds;
        //   } catch (e) {}
        // }
        // if (diffSecond < 0) {
        //   final refreshToken = await TokenStorage().getRefreshToken();
        //   if (refreshToken == null || refreshToken == "") throw Exception('');
        //   try {
        //     Response response = await retryClient.post(
        //       '${BASE_URL}/v1/auth/refresh-token',
        //       options:
        //           Options(headers: {'Authorization': 'Bearer $refreshToken'}),
        //     );
        //     if (response.statusCode == HttpStatus.created) {
        //       Token token = Token.fromJson(response.data);
        //       await TokenStorage().save(token);
        //     }
        //   } catch (e) {
        //     await UserCredentialsStorage().clear();
        //     await TokenStorage().clear();
        //     inject<NavigationService>().pushAndRemoveAll(
        //         route: MaterialPageRoute(
        //             builder: (context) => const LoginView()));
        //   }
        // }
        // final accessToken = await TokenStorage().getAccessToken();
        // if (accessToken != null) {
        //   options.headers.addAll({
        //     'Authorization': 'Bearer $accessToken',
        //   });
        // }
        handler.next(options);
      },
      onError: (e, handler) async {
        if (e.response?.statusCode == 401) {
          String? accessToken = await refreshToken();
          if (accessToken == null) return handler.next(e);
          e.requestOptions.headers['Authorization'] = 'Bearer $accessToken';
          return handler.resolve(await client.fetch(e.requestOptions));
        }
        return handler.next(e);
      },
    );
  }

  Future<String?> refreshToken() async {
    try {
      return null;
    } catch (e) {
      return null;
    }
  }
}
