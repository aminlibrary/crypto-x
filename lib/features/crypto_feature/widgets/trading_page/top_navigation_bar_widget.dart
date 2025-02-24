import 'package:crypto_app/core/widgets/txt.dart';
import 'package:crypto_app/features/crypto_feature/api/models/crypto_model.dart';
import 'package:crypto_app/features/crypto_feature/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopNavigationBarWidget extends StatelessWidget {
  final List<CryptoModel> cryptoData;

  const TopNavigationBarWidget({super.key, required this.cryptoData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          cryptoData.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Consumer(
              builder:
                  (context, ref, child) => GestureDetector(
                    onTap: () {
                      //? change tnb index
                      ref.read(tnbProvider).changeIndex(index);
                    },
                    child: Column(
                      children: [
                        //* crypto name
                        txt(
                          cryptoData[index].symbol,
                          fontWeight: FontWeight.bold,
                        ),

                        //* divider
                        ref.watch(tnbProvider).selectedIndex == index
                            ? Container(
                              width: 25,
                              height: 2,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            )
                            : SizedBox(),
                      ],
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
