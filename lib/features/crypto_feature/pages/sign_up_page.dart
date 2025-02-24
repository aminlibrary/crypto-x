import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/core/widgets/main_wrapper.dart';
import 'package:crypto_app/core/widgets/txt.dart';
import 'package:crypto_app/features/crypto_feature/api/data_source/user_api.dart';
import 'package:crypto_app/features/crypto_feature/api/models/user_model.dart';
import 'package:crypto_app/features/crypto_feature/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailFieldController;
  final TextEditingController nameFieldController;
  final TextEditingController passwordFieldController;
  final TextEditingController confirmPasswordFieldController;
  final PageController pageController;

  const SignUpPage({
    super.key,
    required this.emailFieldController,
    required this.nameFieldController,
    required this.passwordFieldController,
    required this.confirmPasswordFieldController,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    //* focus node
    FocusNode emailFocusNode = FocusNode();
    FocusNode nameFocusNode = FocusNode();
    FocusNode passwordFocusNode = FocusNode();
    FocusNode confirmPasswordFocusNode = FocusNode();

    // widet tree
    return GestureDetector(
      onTap: () {
        emailFocusNode.unfocus();
        nameFocusNode.unfocus();
        passwordFocusNode.unfocus();
        confirmPasswordFocusNode.unfocus();
      },
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* title
                    txt("Sign Up", size: 35, fontWeight: FontWeight.bold),

                    //* subtitle
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: SizedBox(
                        width: 250,
                        child: txt("Create an account and start trading!."),
                      ),
                    ),

                    //* email field
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: TextField(
                        controller: emailFieldController,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        decoration: InputDecoration(labelText: "Email"),
                        focusNode: emailFocusNode,
                      ),
                    ),

                    //* Name field
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: TextField(
                        controller: nameFieldController,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        decoration: InputDecoration(labelText: "Name"),
                        focusNode: nameFocusNode,
                      ),
                    ),

                    //* password field
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: TextField(
                        controller: passwordFieldController,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        decoration: InputDecoration(labelText: "Password"),
                        focusNode: passwordFocusNode,
                      ),
                    ),

                    //* user name field
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: TextField(
                        controller: confirmPasswordFieldController,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        decoration: InputDecoration(
                          labelText: "Confirm password",
                        ),
                        focusNode: confirmPasswordFocusNode,
                      ),
                    ),

                    //* sign in button
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Consumer(
                          builder: (context, ref, child) {
                            return ElevatedButton(
                              onPressed: () async {
                                if (emailFieldController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: txt("Email can't be empty!."),
                                    ),
                                  );
                                } else if (nameFieldController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: txt("Name can't be empty!."),
                                    ),
                                  );
                                } else if (passwordFieldController
                                    .text
                                    .isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: txt("Password can't be empty!."),
                                    ),
                                  );
                                } else if (confirmPasswordFieldController
                                    .text
                                    .isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: txt(
                                        "Confirm password can't be empty!.",
                                      ),
                                    ),
                                  );
                                } else {
                                  //? craete account
                                  if (ref.watch(signProvider).isLoading ==
                                      false) {
                                    //* loading state
                                    ref
                                        .read(signProvider)
                                        .toggleToLoading(true);

                                    //* create data
                                    var response = await UserApi()
                                        .createAccount(
                                          email: emailFieldController.text,
                                          userModel: UserModel(
                                            password:
                                                passwordFieldController.text,
                                            wallet: "unset wallet",
                                            balance: 0.0,
                                            name: nameFieldController.text,
                                          ),
                                        );

                                    if (response == "create account success" &&
                                        context.mounted) {
                                      ref
                                          .read(userProvider)
                                          .getUserData(
                                            UserModel(
                                              password:
                                                  passwordFieldController.text,
                                              wallet: "unset wallet",
                                              balance: 0.0,
                                              name: nameFieldController.text,
                                            ),
                                          );
                                      //? push to main wrapper
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => const MainWrapper(),
                                        ),
                                      );
                                    } else if (context.mounted) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(content: txt(response)),
                                      );

                                      //* loading state
                                      ref
                                          .read(signProvider)
                                          .toggleToLoading(false);
                                    }
                                  }
                                }
                              },
                              child:
                                  ref.watch(signProvider).isLoading == true
                                      ? SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: CircularProgressIndicator(
                                          color: whiteColor,
                                          strokeCap: StrokeCap.round,
                                        ),
                                      )
                                      : txt("Create", color: whiteColor),
                            );
                          },
                        ),
                      ),
                    ),

                    //* divider
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Row(
                        children: [
                          //* right divider
                          Expanded(
                            child: Container(height: 1, color: greyColor),
                          ),

                          //* center text
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.0,
                            ),
                            child: txt("OR", color: greyColor),
                          ),

                          //* left divider
                          Expanded(
                            child: Container(height: 1, color: greyColor),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //* icon
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: Image.asset(
                                  "lib/assets/images/google.png",
                                ),
                              ),

                              //* txt
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: txt("Sign in with google"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //* have  account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //* txt
                        txt("Do you have an account?", size: 12),

                        TextButton(
                          onPressed: () {
                            //? push login page
                            pageController.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: txt(
                            "Login.",
                            size: 12,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
