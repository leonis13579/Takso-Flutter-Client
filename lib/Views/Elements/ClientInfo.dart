import 'package:flutter/material.dart';
import 'package:takso_flutter_client/Models/Client.dart';
import 'package:takso_flutter_client/Views/Interfaces/text.dart';

class ClientInfo extends StatefulWidget {
  const ClientInfo({Key? key}) : super(key: key);

  @override
  _ClientInfoState createState() => _ClientInfoState();
}

class _ClientInfoState extends State<ClientInfo> {
  void updateInfo() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Client().addObservableMethod(updateInfo);
  }

  @override
  void dispose() {
    super.dispose();
    Client().deleteObservableMethod(updateInfo);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/client_info"),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              height: 128,
              width: 128,
              child: Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                      child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.expectedTotalBytes!.toDouble()
                              : null));
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  Client().lastName.value ?? "",
                  color: Colors.white,
                  textSize: 20,
                  outMargin: EdgeInsets.symmetric(vertical: 2.5),
                  textAlign: TextAlign.start,
                ),
                CustomText(
                  Client().name.value ?? "",
                  color: Colors.white,
                  textSize: 20,
                  outMargin: EdgeInsets.symmetric(vertical: 2.5),
                  textAlign: TextAlign.start,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
