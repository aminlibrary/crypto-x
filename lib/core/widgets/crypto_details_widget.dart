import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/core/utils/converts.dart';
import 'package:crypto_app/core/widgets/txt.dart';
import 'package:crypto_app/features/crypto_feature/api/models/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoDetailsWidget extends StatelessWidget {
  final List<CryptoModel> cryptoData;
  final int index;
  const CryptoDetailsWidget({
    super.key,
    required this.cryptoData,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.5),
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
                      "https://s2.coinmarketcap.com/static/img/coins/64x64/${cryptoData[index].id}.png",
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
                    txt(
                      cryptoData[index].name,
                      size: 15,
                      fontWeight: FontWeight.bold,
                    ),

                    //* crypto symbol
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txt(
                        cryptoData[index].symbol,
                        size: 15,
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Row(
            children: [
              //* crypto chart
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: SizedBox(
                  width: 100,
                  child: SvgPicture.network(
                    "https://s3.coinmarketcap.com/generated/sparklines/web/7d/2781/${cryptoData[index].id}.svg",
                    colorFilter: ColorFilter.mode(
                      setCryptoChartColor(
                        priceChange:
                            cryptoData[index].quotes![0].percentChange24h,
                      ),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),

              //* crypto price
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //* price
                  txt(
                    "\$${cryptoData[index].ath.round()}",
                    size: 15,
                    fontWeight: FontWeight.bold,
                  ),

                  //* change
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: txt(
                      "${cryptoData[index].quotes![0].percentChange24h.toStringAsFixed(3)}%",
                      size: 15,
                      color: setCryptoChartColor(
                        priceChange:
                            cryptoData[index].quotes![0].percentChange24h,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
