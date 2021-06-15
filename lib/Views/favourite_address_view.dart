import 'package:flutter/material.dart';

class FavouriteAddressView extends StatelessWidget {
  const FavouriteAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onTap: () {},
            ),
          )
        ],
      ),
      body: Container(),
    );
  }
}
