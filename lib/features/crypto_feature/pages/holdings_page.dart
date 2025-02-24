import 'package:crypto_app/core/widgets/app_bar_widget.dart';
import 'package:crypto_app/core/widgets/crypto_details_widget.dart';
import 'package:crypto_app/core/widgets/error_widget.dart';
import 'package:crypto_app/core/widgets/loading_widget.dart';
import 'package:crypto_app/core/widgets/txt.dart';
import 'package:crypto_app/features/crypto_feature/api/data_source/crypto_api.dart';
import 'package:crypto_app/features/crypto_feature/api/models/crypto_model.dart';
import 'package:flutter/material.dart';

class HoldingsPage extends StatefulWidget {
  const HoldingsPage({super.key});

  @override
  State<HoldingsPage> createState() => _HoldingsPageState();
}

class _HoldingsPageState extends State<HoldingsPage> {
  //? futures
  late Future<List<CryptoModel>> getTopMarketCapCryptoData;

  //? api class
  CryptoApi cryptoApi = CryptoApi();

  //? init state
  @override
  void initState() {
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
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              //* app bar
              AppBarWidget(
                title: txt("Holdings", size: 26, fontWeight: FontWeight.bold),
              ),

              //* list of holdings
              FutureBuilder<List<CryptoModel>>(
                future: getTopMarketCapCryptoData,

                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder:
                            (context, index) => CryptoDetailsWidget(
                              cryptoData: snapshot.data!,
                              index: index,
                            ),
                      ),
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
