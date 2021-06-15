import 'package:dio/dio.dart';
import 'package:takso_flutter_client/Models/AuthData.dart';

import 'NetworkBase.dart';

class AuthNetwork extends NetworkBase {
  static Future<AuthData?> login(AuthData authData) async {
    var client = new Dio();
    try {
      var response = await client.post(NetworkBase.baseUrl + "auth/login",
          data: authData.toMap());
      if (response.statusCode == 200) {
        AuthData.fromJSON(response.data);
        return AuthData();
      } else if (response.statusCode == 400) {
        return AuthData();
      }
    } on DioError catch (e) {
      print(e.message);
      if (e.response != null && e.response!.statusCode == 400) {
        return AuthData();
      }
      return null;
    }
    return null;
  }

  static Future<bool?> register(AuthData authData) async {
    var client = new Dio();

    try {
      var response = await client.post(NetworkBase.baseUrl + "auth/register",
          data: authData.toMap());

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode != null && e.response!.statusCode! == 400) {
          if (e.response!.data != null) {
            return e.response!.data;
          }
        }
      }
      return null;
    }
  }
}
