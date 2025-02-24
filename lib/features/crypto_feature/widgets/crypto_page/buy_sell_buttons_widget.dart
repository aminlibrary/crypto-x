import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/core/widgets/txt.dart';
import 'package:crypto_app/features/crypto_feature/widgets/crypto_page/crypto_buy_sell_widget.dart';
import 'package:flutter/material.dart';

class BuySellButtonsWidget extends StatelessWidget {
  const BuySellButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //* buy button
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.425,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => CryptoBuySellWidget(
                        buttonTxt: "Buy",
                        onTap: () {
                          //? update user data
                        },
                      ),
                );
              },
              child: txt("Buy", color: whiteColor),
            ),
          ),

          //* sell button
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.425,
            height: 40,
            child: OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (context) =>
                          CryptoBuySellWidget(buttonTxt: "Sell", onTap: () {}),
                );
              },
              child: txt(
                "Sell",
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
