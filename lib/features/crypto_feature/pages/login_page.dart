import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/core/widgets/main_wrapper.dart';
import 'package:crypto_app/core/widgets/txt.dart';
import 'package:crypto_app/features/crypto_feature/api/data_source/user_api.dart';
import 'package:crypto_app/features/crypto_feature/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailFieldController;
  final TextEditingController passwordFieldController;
  final PageController pageController;

  const LoginPage({
    super.key,
    required this.emailFieldController,
    required this.passwordFieldController,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    //* focus node
    FocusNode emailFocusNode = FocusNode();
    FocusNode passwordFocusNode = FocusNode();

    // widet tree
    return GestureDetector(
      onTap: () {
        emailFocusNode.unfocus();
        passwordFocusNode.unfocus();
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
                    txt("Login", size: 35, fontWeight: FontWeight.bold),

                    //* subtitle
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: SizedBox(
                        width: 250,
                        child: txt("Login your account and couniue trading!."),
                      ),
                    ),

                    //* user name field
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: TextField(
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        decoration: InputDecoration(labelText: "Email"),
                        focusNode: emailFocusNode,
                        controller: emailFieldController,
                      ),
                    ),

                    //* password field
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: TextField(
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        decoration: InputDecoration(labelText: "Password"),
                        focusNode: passwordFocusNode,
                        controller: passwordFieldController,
                      ),
                    ),

                    //* login button
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Consumer(
                          builder:
                              (context, ref, child) => ElevatedButton(
                                onPressed: () {
                                  if (emailFieldController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: txt("Email can't be empty!."),
                                      ),
                                    );
                                  } else if (passwordFieldController
                                      .text
                                      .isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: txt(
                                          "Password can't be empty!.",
                                        ),
                                      ),
                                    );
                                  } else {
                                    //? login account
                                    if (ref.watch(signProvider).isLoading ==
                                        false) {
                                      //* loading state
                                      ref
                                          .read(signProvider)
                                          .toggleToLoading(true);

                                      //* get data
                                      UserApi()
                                          .getUserData(
                                            email: emailFieldController.text,
                                            password:
                                                passwordFieldController.text,
                                          )
                                          .then((data) {
                                            ref
                                                .read(userProvider)
                                                .getUserData(data);
                                          });

                                      //* loading state
                                      ref
                                          .read(signProvider)
                                          .toggleToLoading(false);

                                      //? push to main wrapper
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => const MainWrapper(),
                                        ),
                                      );
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
                                        : txt("Login", color: whiteColor),
                              ),
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
                                child: txt("Login with google"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //* have not account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //* txt
                        txt("Dont you have an account?", size: 12),

                        TextButton(
                          onPressed: () {
                            //? push sign in page
                            pageController.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: txt(
                            "Create one.",
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
