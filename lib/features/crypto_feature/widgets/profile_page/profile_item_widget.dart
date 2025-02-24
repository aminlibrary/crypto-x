import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/core/widgets/txt.dart';
import 'package:flutter/material.dart';

class ProfileItemWidget extends StatelessWidget {
  final String title;
  final String data;
  const ProfileItemWidget({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //* user naem
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //* title
                  txt(title, color: greyColor),

                  //* data
                  txt(data, size: 18),
                ],
              ),

              //* edit button
              SizedBox(
                width: 80,
                child: TextButton(
                  onPressed: () {},
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: txt(
                      "Edit",
                      color: greyColor,
                      size: 18,
                      decoration: TextDecoration.underline,
                      decorationColor: greyColor,
                    ),
                  ),
                ),
              ),
            ],
          ),

          //* divider
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              width: double.infinity,
              height: 0.5,
              color: greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
