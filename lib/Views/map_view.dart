import 'package:flutter/material.dart';
import 'package:takso_flutter_client/Models/AuthData.dart';

class MapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (AuthData().token == null) {
      Future.microtask(() => Navigator.pushReplacementNamed(context, "/auth"));
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Заказы"),
        backgroundColor: Theme.of(context).primaryColor,
        brightness: Brightness.dark,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              child: Icon(Icons.person),
              onTap: () => Navigator.pushNamed(context, "/client"),
            ),
          )
        ],
      ),
      body: Container(),
    );
  }
}
