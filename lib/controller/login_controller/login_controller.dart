import 'package:flutter/material.dart';
import 'package:test_app/model/login_model/login_model.dart';
import 'package:test_app/utils/colors/colors.dart';
import 'package:test_app/view/home_screen/home_screen.dart';

class Logincontroller extends ChangeNotifier {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  LoginModel? loginModel;

  //controller function to handle the user data from the model.

  LoginModel get login => loginModel!;

  void userInput(LoginModel model) {
    loginModel = model;
    notifyListeners();
  }
///////////////////////////////////////////

  void logIn(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const HomeScreen();
      },
    ));
  }

  bool obscureText = true;
  Icon icon = Icon(
    Icons.visibility_off,
    color: AppColors.kBlack.withOpacity(0.7),
  );

  void visibility() {
    if (obscureText == false) {
      icon = Icon(
        Icons.visibility_off,
        color: AppColors.kBlack.withOpacity(0.7),
      );
      obscureText = true;
      notifyListeners();
    } else {
      icon = Icon(
        Icons.visibility,
        color: AppColors.kBlack.withOpacity(0.7),
      );
      obscureText = false;
      notifyListeners();
    }
  }

  void disposeTextfield() {
    email.clear();
    password.clear();
  }

  String? passwordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must have atleast 6 character';
    } else if (value.length > 6) {
      return 'Password exceeds 8 character';
    }
    return null;
  }

  String? emailValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return 'Invalid email , please enter correct email';
    } else {
      return null;
    }
  }
}
