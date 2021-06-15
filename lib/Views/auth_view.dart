import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:takso_flutter_client/Models/AuthData.dart';
import 'package:takso_flutter_client/Netwotk/AuthNetwork.dart';
import 'package:takso_flutter_client/Views/Interfaces/button.dart';
import 'package:takso_flutter_client/Views/Interfaces/editText.dart';

import 'Interfaces/text.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthData? authData = AuthData();
    final toast = ScaffoldMessenger.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Вход"),
        backgroundColor: Theme.of(context).primaryColor,
        brightness: Brightness.dark,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Theme.of(context).primaryColor,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          "Введите ваш логин",
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
                          "Введите ваш пароль",
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
                        )
                      ],
                    ),
                  ),
                ),
                Button(
                  content: "Войти",
                  textSize: 15,
                  outMargin: EdgeInsets.only(
                    top: 15,
                  ),
                  onPressed: () async {
                    AuthData? answer = await AuthNetwork.login(authData);
                    if (answer == null) {
                      toast.showSnackBar(
                        SnackBar(
                          content: Text("Нет связи с сервером."),
                          action: SnackBarAction(
                            label: "Закрыть",
                            onPressed: toast.hideCurrentSnackBar,
                          ),
                        ),
                      );
                    } else if (answer.token == null) {
                      toast.showSnackBar(
                        SnackBar(
                          content: Text("Неправильные логин или пароль."),
                          action: SnackBarAction(
                            label: "Закрыть",
                            onPressed: toast.hideCurrentSnackBar,
                          ),
                        ),
                      );
                    } else {
                      authData.token = answer.token;
                      Navigator.pushReplacementNamed(context, "/");
                    }
                  },
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 5,
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Color.fromARGB(102, 0, 0, 0),
                      ),
                      text:
                          "Если у вас нет аккаунта, то вы можете\nзарегистрироваться",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, "/register");
                        },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
