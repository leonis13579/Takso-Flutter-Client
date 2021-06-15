import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:takso_flutter_client/Models/AuthData.dart';
import 'package:takso_flutter_client/Models/Client.dart';
import 'package:takso_flutter_client/Netwotk/NetworkBase.dart';

class ClientNetwork extends NetworkBase {
  static Future<Client?> getClientInfo(BuildContext context) async {
    if (AuthData().token != null) {
      var client = new Dio();
      client.options.headers["Authentication"] = AuthData().token;
      try {
        var response =
            await client.get(NetworkBase.baseUrl + "client/get_info");
        if (response.statusCode == 200) {
          Client.fromJSON(response.data);
          return Client();
        } else if (response.statusCode == 400) {
          return Client();
        }
      } on DioError catch (e) {
        print(e.message);
        if (e.response != null && e.response!.statusCode == 400) {
          return Client();
        }
        return null;
      }
      return null;
    } else {
      Navigator.pushNamedAndRemoveUntil(context, "/auth", (route) => false);
      return null;
    }
  }

  static Future<Client?> postClientInfo(
      BuildContext context, Client data) async {
    if (AuthData().token != null) {
      var client = Dio();
      client.options.headers["Authentication"] = AuthData().token;
      try {
        var response = await client.post(
          NetworkBase.baseUrl + "client/post_info",
          data: data.toMap(),
        );
        if (response.statusCode == 200) {
          Client.fromJSON(response.data);
          return Client();
        } else {
          return Client();
        }
      } on DioError catch (e) {
        print(e.message);
        if (e.response != null && e.response!.statusCode == 400) {
          return Client();
        }
        return null;
      }
    } else {
      return null;
    }
  }
}
