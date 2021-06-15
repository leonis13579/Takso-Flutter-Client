import 'package:flutter/material.dart';
import 'package:takso_flutter_client/Models/AuthData.dart';
import 'package:takso_flutter_client/Netwotk/AuthNetwork.dart';

import 'Interfaces/button.dart';
import 'Interfaces/editText.dart';
import 'Interfaces/text.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthData? authData = AuthData();
    final toast = ScaffoldMessenger.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Регистрация"),
        backgroundColor: Theme.of(context).primaryColor,
        brightness: Brightness.dark,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(30),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Theme.of(context).primaryColor,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        CustomText(
                          "Придумайте ваш логин",
                          color: Colors.white,
                          textSize: 15,
                          fontWeight: FontWeight.w500,
                          outMargin: EdgeInsets.only(
                            bottom: 5,
                          ),
                        ),
                        EditText(
                          controller:
                              TextEditingController(text: authData.login),
                          backgroundColor: Theme.of(context).backgroundColor,
                          hintText: "Логин",
                          onSubmited: (value) {
                            authData.login = value;
                          },
                        ),
                        CustomText(
                          "Придумайте ваш пароль",
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
                              TextEditingController(text: authData.password),
                          backgroundColor: Theme.of(context).backgroundColor,
                          hintText: "Пароль",
                          textSize: 15,
                          passwordType: true,
                          onSubmited: (value) {
                            authData.password = value;
                          },
                        ),
                        CustomText(
                          "Повторите ваш пароль",
                          color: Colors.white,
                          textSize: 15,
                          fontWeight: FontWeight.w500,
                          outMargin: EdgeInsets.only(
                            bottom: 5,
                            top: 10,
                          ),
                        ),
                        EditText(
                          backgroundColor: Theme.of(context).backgroundColor,
                          hintText: "Пароль",
                          textSize: 15,
                          passwordType: true,
                          onSubmited: (value) {},
                          onValid: (value) => value == authData.password,
                          errorMessage: "Пароли не совпадают",
                        )
                      ],
                    ),
                  ),
                ),
                Button(
                  content: "Зарегистрироваться",
                  textSize: 15,
                  outMargin: EdgeInsets.only(
                    top: 15,
                  ),
                  onPressed: () async {
                    if (authData.login != null &&
                        authData.login!.isNotEmpty &&
                        authData.password != null &&
                        authData.password!.isNotEmpty) {
                      bool? result = await AuthNetwork.register(authData);
                      if (result != null) {
                        if (result) {
                          Navigator.pop(context);
                        } else {
                          toast.showSnackBar(
                            SnackBar(
                              content:
                                  Text("Данная учетная запись уже имеется."),
                              action: SnackBarAction(
                                label: "Закрыть",
                                onPressed: toast.hideCurrentSnackBar,
                              ),
                            ),
                          );
                        }
                      } else {
                        toast.showSnackBar(
                          SnackBar(
                            content: Text("Ошибка в соединении с сервером."),
                            action: SnackBarAction(
                              label: "Закрыть",
                              onPressed: toast.hideCurrentSnackBar,
                            ),
                          ),
                        );
                      }
                    } else {
                      toast.showSnackBar(
                        SnackBar(
                          content: Text("Вы ввели не все данные."),
                          action: SnackBarAction(
                            label: "Закрыть",
                            onPressed: toast.hideCurrentSnackBar,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
