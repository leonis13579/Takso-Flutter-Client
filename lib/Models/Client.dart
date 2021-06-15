import 'package:takso_flutter_client/Core/ObservableField.dart';
import 'package:takso_flutter_client/Models/Point.dart';

class Client {
  ObsrvableField<String?> name = ObsrvableField();
  ObsrvableField<String?> lastName = ObsrvableField();
  ObsrvableField<String?> phone = ObsrvableField();
  ObsrvableField<String?> email = ObsrvableField();

  ObsrvableField<Point?> homeAddress = ObsrvableField();
  ObsrvableField<Point?> workAddress = ObsrvableField();
  ObsrvableField<List<Point>?> favouriteAddresses = ObsrvableField();

  static Client _instance = Client._constructor();
  factory Client() {
    return _instance;
  }
  static setInstance(Client client) {
    _instance = client;
  }

  Client._constructor();

  static fromJSON(Map<String, dynamic> json) {
    Client client = Client();
    client.name.value = json["name"];
    client.lastName.value = json["lastName"];
    client.phone.value = json["phone"];
    client.email.value = json["email"];

    client.homeAddress.value = json["homeAddress"];
    client.workAddress.value = json["workAddress"];
    client.favouriteAddresses.value = json["favouriteAddresses"];

    _instance = client;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map();
    map["name"] = name.value;
    map["lastName"] = lastName.value;
    map["phone"] = phone.value;
    map["email"] = email.value;

    map["homeAddress"] = homeAddress.value;
    map["workAddress"] = workAddress.value;
    map["favouriteAddresses"] = favouriteAddresses.value;

    return map;
  }

  void addObservableMethod(Function method) {
    name.observeMethods.add(method);
    lastName.observeMethods.add(method);
    phone.observeMethods.add(method);
    email.observeMethods.add(method);
  }

  void deleteObservableMethod(Function method) {
    if (name.observeMethods.contains(method)) {
      name.observeMethods.remove(method);
    }
    if (lastName.observeMethods.contains(method)) {
      lastName.observeMethods.remove(method);
    }
    if (phone.observeMethods.contains(method)) {
      phone.observeMethods.remove(method);
    }
    if (email.observeMethods.contains(method)) {
      email.observeMethods.remove(method);
    }
  }
}
