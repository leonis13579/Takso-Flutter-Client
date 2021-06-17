import 'package:flutter/material.dart';
import 'package:takso_flutter_client/Views/Interfaces/button.dart';
import 'package:takso_flutter_client/Views/Interfaces/editText.dart';
import 'package:takso_flutter_client/Views/Interfaces/text.dart';

class FavouriteAddressInfoView extends StatelessWidget {
  final String? title;

  FavouriteAddressInfoView({this.title});

  @override
  Widget build(BuildContext context) {
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
              child: Column(
                children: [
                  CustomText("Name"),
                  EditText(
                    onSubmited: (value) {},
                  ),
                ],
              ),
            ),
            Button(
              content: "Сохранить",
              onPressed: null,
            )
          ],
        ),
      ),
    );
  }
}
