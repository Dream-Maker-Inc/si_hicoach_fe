import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/data/signup_api.dart';

class SignupFinishViewModel with ChangeNotifier {

  Future<void> signup() async {
    try {
      var response = await SignupApi.signup();

      print("# success");
      print(response.statusCode);
    } catch (e) {

      // TODO 에러처리

      print("# error");
      print(e);
    }

    // notifyListeners();
  }
}
