import 'package:flutter/material.dart';
import 'package:test_app/model/sign_up_model/sign_up_model.dart';
import 'package:test_app/utils/colors/colors.dart';
import 'package:test_app/view/home_screen/home_screen.dart';

class SignUpController extends ChangeNotifier {
  final TextEditingController name = TextEditingController();
  final TextEditingController emailId = TextEditingController();
  final TextEditingController password = TextEditingController();
  TextEditingController datePick = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  DateTime selectDate = DateTime.now();

  SignUpModel? signUpModel;

  //controller function to handle the user data from the model.

  SignUpModel get signup => signUpModel!;

  void userInput(SignUpModel model) {
    signUpModel = model;
    notifyListeners();
  }

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

  String? passwordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must have atleast 6 character';
    } else if (value.length > 6) {
      return 'Password exceeds 6 character';
    }
    return null;
  }

  String? dateValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select the date';
    } else {
      return null;
    }
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

  void dateTime(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(2014, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectDate) {
      selectDate = picked;
      signUpModel!.dob = "${selectDate.toLocal()}".split(' ')[0].toString();
      notifyListeners();
    }
  }
}
