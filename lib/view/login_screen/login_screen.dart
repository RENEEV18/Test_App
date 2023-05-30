import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/controller/login_controller/login_controller.dart';
import 'package:test_app/utils/colors/colors.dart';
import 'package:test_app/utils/styles/sizedbox.dart';
import 'package:test_app/view/sign_up_screen.dart/sign_up_screen.dart';
import 'package:test_app/view/widgets/button_widget.dart';
import 'package:test_app/view/widgets/text_widget.dart';
import 'package:test_app/view/widgets/textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.kDarkPink,
            AppColors.kPurple,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Positioned(
                top: -50,
                right: -50,
                child: CircleAvatar(
                  backgroundColor: AppColors.kBlack.withOpacity(0.1),
                  radius: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: Transform.rotate(
                  alignment: Alignment.bottomRight,
                  angle: -0.3,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.kBlack.withOpacity(0.1),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Consumer<Logincontroller>(
                      builder: (context, value, child) {
                        return Form(
                          key: formGlobalKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppSize.kHeight40,
                              TextfieldWidget(
                                controller: value.email,
                                hintText: "Email",
                                hintStyle: const TextStyle(fontSize: 16),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                                suffixIcon: Icon(
                                  Icons.email_rounded,
                                  color: AppColors.kBlack.withOpacity(0.7),
                                ),
                                errorStyle: const TextStyle(
                                  color: AppColors.kWhite,
                                ),
                                validator: (p0) => value.emailValdation(p0),
                                obscureText: false,
                              ),
                              AppSize.kHeight30,
                              TextfieldWidget(
                                controller: value.password,
                                hintText: "Password",
                                errorStyle: const TextStyle(
                                  color: AppColors.kWhite,
                                ),
                                hintStyle: const TextStyle(fontSize: 16),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      value.visibility();
                                    },
                                    icon: value.icon),
                                validator: (p0) => value.passwordValdation(p0),
                                obscureText: value.obscureText,
                              ),
                              AppSize.kHeight30,
                              ButtonWidget(
                                name: "Login",
                                fontSize: 18,
                                onPressed: () {
                                  if (formGlobalKey.currentState!.validate()) {
                                    formGlobalKey.currentState!.save();
                                    value.logIn(context);
                                  }
                                },
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              AppSize.kHeight20,
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return SignUpScreen();
                                        },
                                      ),
                                    );
                                  },
                                  child: const TextWidget(
                                    name: "Don't have an account? | signup",
                                    color: AppColors.kWhite,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
