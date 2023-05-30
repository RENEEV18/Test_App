import 'package:flutter/material.dart';
import 'package:test_app/utils/colors/colors.dart';
import 'package:test_app/view/home_screen/home_screen.dart';

class Logincontroller extends ChangeNotifier {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

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
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    } else if (value.length > 8) {
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
