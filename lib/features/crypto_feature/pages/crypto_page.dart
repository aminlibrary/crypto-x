import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/core/widgets/error_widget.dart';
import 'package:crypto_app/core/widgets/loading_widget.dart';
import 'package:crypto_app/core/widgets/txt.dart';
import 'package:crypto_app/core/widgets/app_bar_widget.dart';
import 'package:crypto_app/features/crypto_feature/api/data_source/crypto_api.dart';
import 'package:crypto_app/features/crypto_feature/api/models/crypto_model.dart';
import 'package:crypto_app/features/crypto_feature/pages/holdings_page.dart';
import 'package:crypto_app/features/crypto_feature/providers/providers.dart';
import 'package:crypto_app/features/crypto_feature/widgets/crypto_page/balance_card_widget.dart';
import 'package:crypto_app/features/crypto_feature/widgets/crypto_page/buy_sell_buttons_widget.dart';
import 'package:crypto_app/features/crypto_feature/widgets/crypto_page/crypto_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CryptoPage extends StatefulWidget {
  const CryptoPage({super.key});

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  //? futures
  late Future<List<CryptoModel>> getAllCryptoData;
  late Future<List<CryptoModel>> getTopMarketCapCryptoData;

  //? api class
  CryptoApi cryptoApi = CryptoApi();

  //? init state
  @override
  void initState() {
    getAllCryptoData = cryptoApi.getAllCryptoData();
    getTopMarketCapCryptoData = cryptoApi.getTopMarketCapCryptoData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* app bar
              AppBarWidget(
                title: CircleAvatar(
                  backgroundColor: Theme.of(context).cardColor,
                  child: Icon(Icons.person_outline_rounded),
                ),
              ),

              //* hello txt
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Consumer(
                  builder:
                      (context, ref, child) => txt(
                        "Hello ${ref.watch(userProvider).userModel.name}.",
                        size: 20,
                      ),
                ),
              ),

              //* balance card
              BalanceCardWidget(),

              //* buy and sell buttons
              BuySellButtonsWidget(),

              //* holdings
              FutureBuilder<List<CryptoModel>>(
                future: getTopMarketCapCryptoData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        //* crypto title
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //* title
                              txt(
                                "Holdings",
                                size: 20,
                                fontWeight: FontWeight.bold,
                              ),

                              //* see all button
                              TextButton(
                                onPressed: () {
                                  //? push to holdings page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const HoldingsPage(),
                                    ),
                                  );
                                },
                                child: txt(
                                  "See all",
                                  color: greyColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor: greyColor,
                                ),
                              ),
                            ],
                          ),
                        ),

                        //* crypto list
                        CryptoListWidget(cryptoData: snapshot.data!),
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
      ),
    );
  }
}
