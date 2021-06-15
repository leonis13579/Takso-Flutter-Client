import 'package:flutter/material.dart';
import 'package:takso_flutter_client/Models/AuthData.dart';
import 'package:takso_flutter_client/Models/Client.dart';
import 'package:takso_flutter_client/Netwotk/ClientNetwork.dart';
import 'package:takso_flutter_client/Views/Elements/ClientButton.dart';
import 'package:takso_flutter_client/Views/Elements/ClientInfo.dart';
import 'package:takso_flutter_client/Views/Interfaces/button.dart';

class ClientView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Client?>(
      future: ClientNetwork.getClientInfo(context),
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: Text("Личный кабинет"),
            backgroundColor: Theme.of(context).primaryColor,
            brightness: Brightness.dark,
          ),
          body: (() {
            if (snapshot.hasData) {
              Client.setInstance(snapshot.data!);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        ClientInfo(),
                        ClientButton(
                          title: "Избранные адреса",
                          path: "/favourite_address",
                        ),
                        ClientButton(
                          title: "История заказов",
                          path: "/history",
                        )
                      ],
                    ),
                    Button(
                      outMargin: EdgeInsets.all(10),
                      textSize: 18,
                      colorButton: Colors.red[900],
                      content: "Выйти из аккаунта",
                      onPressed: () {
                        AuthData().token = null;
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/auth",
                          (r) => false,
                        );
                      },
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }()),
        );
      },
    );
  }
}
