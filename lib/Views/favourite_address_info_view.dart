import 'package:flutter/material.dart';
import 'package:takso_flutter_client/Models/Client.dart';
import 'package:takso_flutter_client/Models/Point.dart';
import 'package:takso_flutter_client/Views/Interfaces/button.dart';
import 'package:takso_flutter_client/Views/Interfaces/editText.dart';
import 'package:takso_flutter_client/Views/Interfaces/text.dart';

class FavouriteAddressInfoView extends StatelessWidget {
  final String? title;

  FavouriteAddressInfoView({this.title});

  @override
  Widget build(BuildContext context) {
    String name = "";
    Point point = Point(address: "");

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(title ?? "Добавить место"),
        backgroundColor: Theme.of(context).primaryColor,
        brightness: Brightness.dark,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    CustomText(
                      "Введите назавание места",
                      color: Colors.white,
                      textSize: 15,
                      fontWeight: FontWeight.w500,
                      outMargin: EdgeInsets.only(
                        bottom: 5,
                      ),
                    ),
                    EditText(
                      backgroundColor: Theme.of(context).backgroundColor,
                      hintText: "Название места",
                      onSubmited: (value) {
                        name = value;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      "Введите адрес",
                      color: Colors.white,
                      textSize: 15,
                      fontWeight: FontWeight.w500,
                      outMargin: EdgeInsets.only(
                        bottom: 5,
                      ),
                    ),
                    EditText(
                      backgroundColor: Theme.of(context).backgroundColor,
                      hintText: "Адрес места",
                      onSubmited: (value) {
                        point.address = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Button(
              content: "Сохранить",
              onPressed: () {
                if (name != "" && point.address != ""
                    // && point.pointLatitude != null && point.pointLongitude != null
                    ) {
                  Client().favouriteAddresses.value![name] = point;
                  Client().favouriteAddresses.updated();
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
