import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class AuthService {
  static SharedPreferences? pref;

  Future<bool> login(String username, String password) async {
    String uri = 'https://api.test.f-rayscoring.com/token';
    Map<String, dynamic> data = {
      "username": username,
      "password": password,
      "grant_type": "password",
      "client_id": "",
      "client_secret": ""
    };
    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap(data);
      var response = await dio.post(uri, data: formData);
      var res = response.data;
      await setToken(res['access_token'], res['refresh_token']);
    } catch (e) {
      print(e);
    }

    return Future.delayed(Duration(milliseconds: 1), () {
      return true;
    });
  }

  static setToken(String token, String refreshToken) async {
    pref = await SharedPreferences.getInstance();
    await pref?.setString('token', token);
    await pref?.setString('refreshToken', refreshToken);
  }

  static Future<String> getToken() async {
    pref = await SharedPreferences.getInstance();
    return pref!.getString('token') ?? "";
  }

  static Future<String> getRefreshToken() async {
    pref = await SharedPreferences.getInstance();
    return pref!.getString('refreshToken') ?? "";
  }

  static removeToken() async {
    pref = await SharedPreferences.getInstance();
    pref!.clear();
  }

  static refreshToken() async {
    try {
      final refreshToken = await AuthService.getRefreshToken();
      Map<String, dynamic> data = {
        "grant_type": "refresh_token",
        "client_id": "",
        "client_secret": "",
        "refresh_token": refreshToken
      };
      var dio = Dio();
      FormData formData = new FormData.fromMap(data);
      var response = await dio.post("https://api.test.f-rayscoring.com/token",
          data: formData);
      var res = response.data;
      await setToken(res['access_token'], res['refresh_token']);
    } catch (e) {
      print(e);
    }
  }
}
