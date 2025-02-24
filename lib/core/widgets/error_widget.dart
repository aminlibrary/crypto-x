import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/core/widgets/txt.dart';
import 'package:flutter/material.dart';

class OnErrorWidget extends StatelessWidget {
  const OnErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: txt("Error! - Couldn't load data.", color: redColor, size: 18),
      ),
    );
  }
}
