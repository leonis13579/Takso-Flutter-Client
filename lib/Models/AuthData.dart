class AuthData {
  String? login;
  String? password;
  String? token;
  String type = "Client";

  static AuthData _instance = AuthData._constructor();
  factory AuthData() {
    return _instance;
  }
  static setInstance(AuthData authData) {
    _instance = authData;
  }

  AuthData._constructor();

  static fromJSON(Map<String, dynamic> json) {
    AuthData authData = AuthData();
    authData.login = json["login"];
    authData.password = json["password"];
    authData.token = json["token"];
    authData.type = json["type"];

    _instance = authData;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map();
    map["login"] = login;
    map["password"] = password;
    map["token"] = token;
    map["type"] = type;

    return map;
  }
}
