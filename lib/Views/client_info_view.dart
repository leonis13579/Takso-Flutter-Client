import 'package:flutter/material.dart';
import 'package:takso_flutter_client/Models/Client.dart';
import 'package:takso_flutter_client/Netwotk/ClientNetwork.dart';
import 'package:takso_flutter_client/Views/Interfaces/button.dart';
import 'package:takso_flutter_client/Views/Interfaces/editText.dart';
import 'package:takso_flutter_client/Views/Interfaces/text.dart';

class ClientInfoView extends StatelessWidget {
  const ClientInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Информация о клиенте"),
        backgroundColor: Theme.of(context).primaryColor,
        brightness: Brightness.dark,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              margin: EdgeInsets.all(20),
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      "Введите вашу фамилию",
                      color: Colors.white,
                      textSize: 15,
                      fontWeight: FontWeight.w500,
                      outMargin: EdgeInsets.only(
                        bottom: 5,
                        top: 10,
                      ),
                    ),
                    EditText(
                      controller:
                          TextEditingController(text: Client().lastName.value),
                      backgroundColor: Theme.of(context).backgroundColor,
                      hintText: "Фамилия",
                      textSize: 16,
                      onSubmited: (value) {
                        Client().lastName.value = value;
                      },
                    ),
                    CustomText(
                      "Введите ваше имя",
                      color: Colors.white,
                      textSize: 15,
                      fontWeight: FontWeight.w500,
                      outMargin: EdgeInsets.only(
                        bottom: 5,
                      ),
                    ),
                    EditText(
                      controller:
                          TextEditingController(text: Client().name.value),
                      backgroundColor: Theme.of(context).backgroundColor,
                      hintText: "Имя",
                      onSubmited: (value) {
                        Client().name.value = value;
                      },
                    ),
                    CustomText(
                      "Введите ваш номер телефона",
                      color: Colors.white,
                      textSize: 15,
                      fontWeight: FontWeight.w500,
                      outMargin: EdgeInsets.only(
                        bottom: 5,
                        top: 10,
                      ),
                    ),
                    EditText(
                      controller:
                          TextEditingController(text: Client().phone.value),
                      backgroundColor: Theme.of(context).backgroundColor,
                      hintText: "Телефон",
                      textSize: 15,
                      onSubmited: (value) {
                        Client().phone.value = value;
                      },
                    ),
                    CustomText(
                      "Введите вашу электронную почту",
                      color: Colors.white,
                      textSize: 15,
                      fontWeight: FontWeight.w500,
                      outMargin: EdgeInsets.only(
                        bottom: 5,
                        top: 10,
                      ),
                    ),
                    EditText(
                      controller:
                          TextEditingController(text: Client().email.value),
                      backgroundColor: Theme.of(context).backgroundColor,
                      hintText: "Электронная почта",
                      textSize: 15,
                      onSubmited: (value) {
                        Client().email.value = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Button(
              content: "Сохранить",
              onPressed: () async {
                var response = await ClientNetwork.postClientInfo(
                  context,
                  Client(),
                );

                if (response == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Не удалось отправить данные"),
                      action: SnackBarAction(
                        label: "Закрыть",
                        onPressed: () =>
                            ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                      ),
                    ),
                  );
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
