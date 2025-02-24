import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final Widget title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //* title
        title,

        //* settings icon
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings_outlined,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }
}
