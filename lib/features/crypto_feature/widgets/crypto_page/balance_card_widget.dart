import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/core/widgets/txt.dart';
import 'package:crypto_app/features/crypto_feature/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceCardWidget extends StatelessWidget {
  const BalanceCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Stack(
          children: [
            //* card
            Image.asset(
              "lib/assets/images/balance_card.png",
              width: double.infinity,
              fit: BoxFit.fill,
            ),

            //* balance txt
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //* title
                  txt("Current Balance", color: blackColor),

                  //* balance details
                  Row(
                    children: [
                      //* amount
                      Consumer(
                        builder:
                            (context, ref, child) => txt(
                              "\$ ${ref.watch(userProvider).userModel.balance}",
                              color: blackColor,
                              size: 26,
                              fontWeight: FontWeight.bold,
                            ),
                      ),

                      //* profit
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: txt(
                          "+ 20%",
                          color: greenColor,
                          size: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
