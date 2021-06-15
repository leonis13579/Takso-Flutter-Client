import 'package:flutter_test/flutter_test.dart';
import 'package:takso_flutter_client/Models/AuthData.dart';
import 'package:takso_flutter_client/Netwotk/AuthNetwork.dart';

void main() {
  group("AuthTesting", () {
    test("Testing auth", () async {
      AuthData authData = new AuthData();
      authData.login = "driver";
      authData.password = "driver";

      AuthData? auth = await AuthNetwork.login(authData);
      expect(auth, isNot(equals(null)));
      expect(auth!.token, isNot(equals(null)));
    });

    test("Testing bad auth", () async {
      AuthData authData = new AuthData();
      authData.login = "admin";
      authData.password = "admin";

      AuthData? auth = await AuthNetwork.login(authData);
      expect(auth, equals(null));
    });
  });
}
