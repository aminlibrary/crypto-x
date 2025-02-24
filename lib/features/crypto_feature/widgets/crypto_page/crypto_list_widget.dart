import 'package:crypto_app/core/widgets/crypto_details_widget.dart';
import 'package:crypto_app/features/crypto_feature/api/models/crypto_model.dart';
import 'package:flutter/material.dart';

class CryptoListWidget extends StatelessWidget {
  final List<CryptoModel> cryptoData;

  const CryptoListWidget({required this.cryptoData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        4,
        (index) => CryptoDetailsWidget(cryptoData: cryptoData, index: index),
      ),
    );
  }
}
