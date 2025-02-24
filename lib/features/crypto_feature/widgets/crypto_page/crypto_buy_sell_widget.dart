import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/core/widgets/txt.dart';
import 'package:flutter/material.dart';

class CryptoBuySellWidget extends StatelessWidget {
  final String buttonTxt;
  final Function()? onTap;
  const CryptoBuySellWidget({super.key, required this.buttonTxt, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      content: SizedBox(
        width: 100,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* title
              txt("$buttonTxt Crypto", size: 16, fontWeight: FontWeight.bold),

              Column(
                children: [
                  //* amount field
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Crypto amount",
                        hintStyle: TextStyle(color: greyColor),
                      ),
                    ),
                  ),

                  //* Button
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: onTap,
                        child: txt(buttonTxt),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
