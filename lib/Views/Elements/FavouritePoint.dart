import 'package:flutter/material.dart';
import 'package:takso_flutter_client/Models/Point.dart';
import 'package:takso_flutter_client/Views/Interfaces/text.dart';

class FavouritePoint extends StatelessWidget {
  final String title;
  final Point? point;

  FavouritePoint({required this.title, this.point});

  @override
  Widget build(BuildContext context) {
    Icon? icon;
    if (title == "Дом") {
      icon = Icon(
        Icons.home,
        color: Colors.white,
        size: 35,
      );
    } else if (title == "Работа") {
      icon = Icon(
        Icons.work,
        color: Colors.white,
        size: 35,
      );
    }

    return Card(
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            if (icon != null) icon,
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title,
                    textSize: 18,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    point != null ? point!.address : "Нажмите, чтобы задать",
                    textSize: 15,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
