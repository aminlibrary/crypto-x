import 'package:crypto_app/features/crypto_feature/pages/login_page.dart';
import 'package:crypto_app/features/crypto_feature/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class SignWrapper extends StatelessWidget {
  const SignWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //* text controllers
    final TextEditingController emailFieldController = TextEditingController();
    final TextEditingController nameFieldController = TextEditingController();
    final TextEditingController passwordFieldController =
        TextEditingController();
    final TextEditingController confirmPasswordFieldController =
        TextEditingController();

    //* page controller
    final PageController pageController = PageController();

    // widget tree
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            LoginPage(
              pageController: pageController,
              emailFieldController: emailFieldController,
              passwordFieldController: passwordFieldController,
            ),
            SignUpPage(
              emailFieldController: emailFieldController,
              nameFieldController: nameFieldController,
              passwordFieldController: passwordFieldController,
              confirmPasswordFieldController: confirmPasswordFieldController,
              pageController: pageController,
            ),
          ],
        ),
      ),
    );
  }
}
