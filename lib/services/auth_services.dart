import 'package:dio/dio.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/models/auth_models/log_out_model.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/models/auth_models/login_model.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/models/auth_models/register_model.dart';
import 'package:nusantara_infrastructure_pre_screen_test/utils/constant/url.dart';

class AuthServices {
  static final Dio _dio = Dio();

  static Map<String, String> head = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<LoginData?> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> data = {'email': email, 'password': password};
    try {
      Response response = await _dio.post(Url.baseUrl + Url.login,
          data: data, options: Options(headers: head));
      if (response.statusCode == 200) {
        return LoginData.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<RegisterData?> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    Map<String, dynamic> data = {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
    };
    try {
      Response response = await _dio.post(
        Url.baseUrl + Url.register,
        data: data,
        options: Options(headers: head),
      );
      if (response.statusCode == 200) {
        return RegisterData.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<LoggedOut?> logOut({
    required String token,
  }) async {
    try {
      _dio.options.headers['Authorization'] = "Bearer $token";
      Response response = await _dio.delete(
        '${Url.baseUrl}${Url.user}/logout',
        options: Options(headers: head),
      );
      if (response.statusCode == 200) {
        return LoggedOut.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
