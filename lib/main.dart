import 'package:flutter/material.dart';
import 'package:takso_flutter_client/Views/auth_view.dart';
import 'package:takso_flutter_client/Views/client_info_view.dart';
import 'package:takso_flutter_client/Views/client_view.dart';
import 'package:takso_flutter_client/Views/favourite_address_info_view.dart';
import 'package:takso_flutter_client/Views/favourite_address_view.dart';
import 'package:takso_flutter_client/Views/history_view.dart';
import 'package:takso_flutter_client/Views/map_view.dart';
import 'package:takso_flutter_client/Views/register_view.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        "/": (context) => MapView(),
        "/register": (context) => RegisterView(),
        "/auth": (context) => AuthView(),
        "/client": (context) => ClientView(),
        "/client_info": (context) => ClientInfoView(),
        "/favourite_address": (context) => FavouriteAddressView(),
        "/favourite_address_info": (context) => FavouriteAddressInfoView(),
        "/history": (context) => HistoryView(),
      },
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 51, 51, 51),
        backgroundColor: Color.fromARGB(255, 255, 252, 236),
      ),
    ),
  );
}
