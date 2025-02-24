import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height: 400,
        child: Center(
          child: const CircularProgressIndicator(strokeCap: StrokeCap.round),
        ),
      ),
    );
  }
}
