import 'package:flutter/material.dart';
import 'package:test_app/utils/colors/colors.dart';
import 'package:test_app/view/home_screen/home_screen.dart';

class SignUpController extends ChangeNotifier {
  final TextEditingController name = TextEditingController();
  final TextEditingController emailId = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  void signupUser(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const HomeScreen();
      },
    ));
  }

  void disposeTextfield() {
    name.clear();
    emailId.clear();
    password.clear();
    phoneNo.clear();
    confirmPassword.clear();
  }

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the username';
    } else {
      return null;
    }
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

  String? mobileValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (value.length < 10) {
      return 'Invalid mobile number,make sure your entered 10 digits';
    } else {
      return null;
    }
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

  String? confirmpasswordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    } else if (value != password.text) {
      return 'Password does not match';
    } else {
      return null;
    }
  }

  bool obscureText = true;
  Icon icon = const Icon(
    Icons.visibility_off,
    color: AppColors.kBlack,
  );

  void visibility() {
    if (obscureText == false) {
      icon = const Icon(
        Icons.visibility_off,
        color: AppColors.kBlack,
      );
      obscureText = true;
      notifyListeners();
    } else {
      icon = const Icon(
        Icons.visibility,
        color: AppColors.kBlack,
      );
      obscureText = false;
      notifyListeners();
    }
  }
}
