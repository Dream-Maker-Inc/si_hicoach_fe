import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/data/signup_api.dart';

class SignupFinishViewModel with ChangeNotifier {
  Future<void> signup() async {
    final result = await SignupApi.signup();

    result.when(
      (exception) => print(exception), // TODO: Handle exception
      (response) => print(response), // TODO: Do something with location
    );

    // notifyListeners();
  }
}
