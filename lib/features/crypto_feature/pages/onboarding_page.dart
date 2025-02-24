import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/core/widgets/txt.dart';
import 'package:crypto_app/features/crypto_feature/pages/crypto_page.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* title
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20,
              ),
              child: RichText(
                text: TextSpan(
                  text: "Crypto",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: "poppins",
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  children: [
                    TextSpan(text: "X", style: TextStyle(color: purpleColor)),
                  ],
                ),
              ),
            ),

            //* title image
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Image.asset(
                  "lib/assets/images/shape.png",
                  width: 350,
                  height: 350,
                  fit: BoxFit.fill,
                ),
              ),
            ),

            //* description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: txt(
                "Jump start your crypto portfolio",
                size: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            //* sub-description
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20,
              ),
              child: SizedBox(
                width: 250,
                child: txt("Take your investment portfolioto next level"),
              ),
            ),

            //* get start button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    //? push to crypto page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CryptoPage(),
                      ),
                    );
                  },
                  child: txt("Get Started"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
