import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/core/utils/converts.dart';
import 'package:crypto_app/core/widgets/txt.dart';
import 'package:crypto_app/features/crypto_feature/api/models/crypto_model.dart';
import 'package:flutter/material.dart';

class TradingCryptoDetailWidget extends StatelessWidget {
  final CryptoModel cryptoData;

  const TradingCryptoDetailWidget({super.key, required this.cryptoData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              //* crypto icon
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).cardColor,
                    ),
                    child: const SizedBox(),
                  ),

                  SizedBox(
                    width: 35,
                    height: 35,
                    child: Image.network(
                      "https://s2.coinmarketcap.com/static/img/coins/64x64/${cryptoData.id}.png",
                    ),
                  ),
                ],
              ),

              //* crypto details
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* crypto full name
                    txt("Crypto Name", size: 15, fontWeight: FontWeight.bold),

                    //* crypto short name
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txt("CRP", size: 15, color: greyColor),
                    ),
                  ],
                ),
              ),
            ],
          ),

          //* crypto price
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //* price
              txt(
                "\$${cryptoData.quotes![0].price.round()}",
                size: 15,
                fontWeight: FontWeight.bold,
              ),

              //* change
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: txt(
                  "${cryptoData.quotes![0].percentChange24h.toStringAsFixed(3)}%",
                  size: 15,
                  color: setCryptoChartColor(
                    priceChange: cryptoData.quotes![0].percentChange24h,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
