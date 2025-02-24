//? set crypto chart color based on price change
import 'package:crypto_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

Color setCryptoChartColor({required double priceChange}) {
  switch (priceChange) {
    case < 0:
      return redColor;

    case > 0:
      return greenColor;

    default:
      return yellowColor;
  }
}
