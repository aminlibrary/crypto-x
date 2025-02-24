import 'package:crypto_app/core/providers/app_provider.dart';
import 'package:crypto_app/features/crypto_feature/pages/crypto_page.dart';
import 'package:crypto_app/features/crypto_feature/pages/profile_page.dart';
import 'package:crypto_app/features/crypto_feature/pages/trading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //* bnb icon list
    List<IconData> iconList = [
      Icons.dashboard_outlined,
      Icons.currency_exchange_rounded,
      Icons.person_outline_rounded,
    ];

    //* page controller
    PageController pageController = PageController();

    // widget tree
    return Scaffold(
      //* bottom navigation bar
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 75,
        color: Theme.of(context).bottomAppBarTheme.color,
        child: Consumer(
          builder:
              (context, ref, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                  (index) => IconButton(
                    icon: Icon(
                      iconList[index],
                      color:
                          index == ref.watch(appProvider).selectedIndex
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onPrimary,
                      size: 30,
                    ),
                    onPressed: () {
                      //? change page index
                      ref.read(appProvider).changeIndex(index);

                      //? change page
                      pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                  ),
                ),
              ),
        ),
      ),

      //* app body
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: PageView(
          controller: pageController,
          children: [CryptoPage(), TradingPage(), ProfilePage()],
        ),
      ),
    );
  }
}
