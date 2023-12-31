import 'package:dio/dio.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/models/profile_models/profiles_models.dart';
import 'package:nusantara_infrastructure_pre_screen_test/utils/constant/url.dart';

class ProfileServices {
  static final Dio _dio = Dio();

  static Map<String, String> head = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<Profile?> getProfile({
    required String token,
  }) async {
    try {
      _dio.options.headers['Authorization'] = "Bearer $token";
      Response response = await _dio.get(
        '${Url.baseUrl}${Url.user}',
        options: Options(headers: head),
      );
      if (response.statusCode == 200) {
        return Profile.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
