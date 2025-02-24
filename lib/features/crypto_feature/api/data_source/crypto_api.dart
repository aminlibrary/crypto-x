import 'package:crypto_app/features/crypto_feature/api/models/crypto_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CryptoApi {
  //? get all of crypto data
  Future<List<CryptoModel>> getAllCryptoData() async {
    //* crypto data list
    List<CryptoModel> cryptoData = [];

    //* try catch
    try {
      //* send request
      Response response = await Dio().get(
        "https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=1000&sortBy=market_cap&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap",
      );

      //* check status
      if (response.statusCode == 200) {
        //* convert
        for (var items in response.data["data"]["cryptoCurrencyList"]) {
          cryptoData.add(CryptoModel.fromJson(items));
        }

        //* return data
        return cryptoData;
      } else {
        //* error handle
        debugPrint("Error on status code - all crypto: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      //* error handle
      debugPrint("Error on catch - all crypto: $e");
      return [];
    }
  }

  //? get top market cap crypto data
  Future<List<CryptoModel>> getTopMarketCapCryptoData() async {
    //* crypto data list
    List<CryptoModel> cryptoData = [];

    //* try catch
    try {
      //* send request
      Response response = await Dio().get(
        "https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=30&sortBy=market_cap&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap",
      );

      //* check status
      if (response.statusCode == 200) {
        //* convert
        for (var items in response.data["data"]["cryptoCurrencyList"]) {
          cryptoData.add(CryptoModel.fromJson(items));
        }

        //* return data
        return cryptoData;
      } else {
        //* error handle
        debugPrint(
          "Error on status code - top market cap crypto: ${response.statusCode}",
        );
        return [];
      }
    } catch (e) {
      //* error handle
      debugPrint("Error on catch - top market cap crypto: $e");
      return [];
    }
  }
}
