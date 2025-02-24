import 'package:crypto_app/configs/app_theme.dart';
import 'package:crypto_app/core/widgets/sign_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //? theme class
    AppTheme appTheme = AppTheme();

    // widget tree
    return SafeArea(
      child: MaterialApp(
        title: "Crypto App",
        debugShowCheckedModeBanner: false,
        theme: appTheme.lightThemeData,
        darkTheme: appTheme.darkThemeData,
        themeMode: ThemeMode.system,
        home: const SignWrapper(),
      ),
    );
  }
}
