import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/core/widgets/app_bar_widget.dart';
import 'package:crypto_app/core/widgets/error_widget.dart';
import 'package:crypto_app/core/widgets/loading_widget.dart';
import 'package:crypto_app/core/widgets/txt.dart';
import 'package:crypto_app/features/crypto_feature/api/data_source/crypto_api.dart';
import 'package:crypto_app/features/crypto_feature/api/models/crypto_model.dart';
import 'package:crypto_app/features/crypto_feature/providers/providers.dart';
import 'package:crypto_app/features/crypto_feature/widgets/crypto_page/buy_sell_buttons_widget.dart';
import 'package:crypto_app/features/crypto_feature/widgets/trading_page/crypto_chart_widget.dart';
import 'package:crypto_app/features/crypto_feature/widgets/trading_page/top_navigation_bar_widget.dart';
import 'package:crypto_app/features/crypto_feature/widgets/trading_page/trading_crypto_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TradingPage extends StatefulWidget {
  const TradingPage({super.key});

  @override
  State<TradingPage> createState() => _TradingPageState();
}

class _TradingPageState extends State<TradingPage> {
  //? futures
  late Future<List<CryptoModel>> getAllCryptoData;

  //? api class
  CryptoApi cryptoApi = CryptoApi();

  //? init state
  @override
  void initState() {
    getAllCryptoData = cryptoApi.getAllCryptoData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* app bar
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AppBarWidget(
                title: txt("Trading", size: 26, fontWeight: FontWeight.bold),
              ),
            ),

            FutureBuilder<List<CryptoModel>>(
              future: getAllCryptoData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      //* top navigation bar
                      TopNavigationBarWidget(cryptoData: snapshot.data!),

                      Consumer(
                        builder:
                            (context, ref, child) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //* crypto detail
                                TradingCryptoDetailWidget(
                                  cryptoData:
                                      snapshot.data![ref
                                          .watch(tnbProvider)
                                          .selectedIndex],
                                ),

                                //* crypto chart
                                CryptoChartWidget(),

                                //* buy and sell buttons
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: BuySellButtonsWidget(),
                                ),

                                //* at price
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 30.0,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      txt(
                                        "At price | USD",
                                        size: 12,
                                        color: greyColor,
                                      ),
                                      SizedBox(height: 5),
                                      txt("0.031"),
                                    ],
                                  ),
                                ),

                                //* divider
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10.0,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 0.5,
                                    decoration: BoxDecoration(color: greyColor),
                                  ),
                                ),

                                //* at price
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20.0,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      txt("Amount", size: 12, color: greyColor),
                                      SizedBox(height: 5),
                                      txt("345 USD"),
                                    ],
                                  ),
                                ),

                                //* divider
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10.0,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 0.5,
                                    decoration: BoxDecoration(color: greyColor),
                                  ),
                                ),
                              ],
                            ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return OnErrorWidget();
                } else {
                  return LoadingWidget();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
