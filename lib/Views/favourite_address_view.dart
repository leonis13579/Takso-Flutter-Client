import 'package:flutter/material.dart';
import 'package:takso_flutter_client/Models/Client.dart';
import 'package:takso_flutter_client/Models/Point.dart';
import 'package:takso_flutter_client/Views/Elements/FavouritePoint.dart';

class FavouriteAddressView extends StatefulWidget {
  const FavouriteAddressView({Key? key}) : super(key: key);

  @override
  _FavouriteAddressViewState createState() => _FavouriteAddressViewState();
}

class _FavouriteAddressViewState extends State<FavouriteAddressView> {
  void updateData() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Client().addObservableMethod(updateData);
  }

  @override
  void dispose() {
    super.dispose();
    Client().deleteObservableMethod(updateData);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Point?> points = {
      "Дом": Client().homeAddress.value,
      "Работа": Client().workAddress.value,
    }..addAll(Client().favouriteAddresses.value != null
        ? Client().favouriteAddresses.value!
        : {});

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Избранные адреса"),
        backgroundColor: Theme.of(context).primaryColor,
        brightness: Brightness.dark,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              child: Icon(Icons.add),
              onTap: () {
                Navigator.pushNamed(context, "/favourite_address_info");
              },
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: points.length,
        itemBuilder: (context, i) {
          final keys = points.keys.toList();

          return Dismissible(
            direction: keys[i] == "Дом" || keys[i] == "Работа"
                ? DismissDirection.none
                : DismissDirection.startToEnd,
            key: Key(keys[i]),
            child: FavouritePoint(
              title: keys[i],
              point: points[keys[i]],
            ),
            onDismissed: (direction) {
              setState(() {
                points.remove(keys[i]);
              });
            },
          );
        },
      ),
    );
  }
}
