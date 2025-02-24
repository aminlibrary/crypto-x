class CryptoModel {
  final dynamic id;
  final dynamic name;
  final dynamic symbol;
  final dynamic slug;
  final dynamic cmcRank;
  final dynamic marketPairCount;
  final dynamic circulatingSupply;
  final dynamic selfReportedCirculatingSupply;
  final dynamic totalSupply;
  final dynamic maxSupply;
  final dynamic ath;
  final dynamic atl;
  final dynamic high24h;
  final dynamic low24h;
  final dynamic isActive;
  final dynamic lastUpdated;
  final dynamic dateAdded;
  final List<Quotes>? quotes;
  final bool? isAudited;
  final List<dynamic>? auditInfoList;
  final List<dynamic>? badges;

  CryptoModel({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.cmcRank,
    this.marketPairCount,
    this.circulatingSupply,
    this.selfReportedCirculatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.atl,
    this.high24h,
    this.low24h,
    this.isActive,
    this.lastUpdated,
    this.dateAdded,
    this.quotes,
    this.isAudited,
    this.auditInfoList,
    this.badges,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      id: json['id'] as dynamic,
      name: json['name'] as dynamic,
      symbol: json['symbol'] as dynamic,
      slug: json['slug'] as dynamic,
      cmcRank: json['cmcRank'] as dynamic,
      marketPairCount: json['marketPairCount'] as dynamic,
      circulatingSupply: json['circulatingSupply'] as dynamic,
      selfReportedCirculatingSupply:
          json['selfReportedCirculatingSupply'] as dynamic,
      totalSupply: json['totalSupply'] as dynamic,
      maxSupply: json['maxSupply'] as dynamic,
      ath: json['ath'] as dynamic,
      atl: json['atl'] as dynamic,
      high24h: json['high24h'] as dynamic,
      low24h: json['low24h'] as dynamic,
      isActive: json['isActive'] as dynamic,
      lastUpdated: json['lastUpdated'] as dynamic,
      dateAdded: json['dateAdded'] as dynamic,
      quotes:
          (json['quotes'] as List?)
              ?.map((dynamic e) => Quotes.fromJson(e as Map<String, dynamic>))
              .toList(),
      isAudited: json['isAudited'] as bool?,
      auditInfoList: json['auditInfoList'] as List?,
      badges: (json['badges'] as List?)?.map((dynamic e) => e as int).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'symbol': symbol,
    'slug': slug,
    'cmcRank': cmcRank,
    'marketPairCount': marketPairCount,
    'circulatingSupply': circulatingSupply,
    'selfReportedCirculatingSupply': selfReportedCirculatingSupply,
    'totalSupply': totalSupply,
    'maxSupply': maxSupply,
    'ath': ath,
    'atl': atl,
    'high24h': high24h,
    'low24h': low24h,
    'isActive': isActive,
    'lastUpdated': lastUpdated,
    'dateAdded': dateAdded,
    'quotes': quotes?.map((e) => e.toJson()).toList(),
    'isAudited': isAudited,
    'auditInfoList': auditInfoList,
    'badges': badges,
  };
}

class Quotes {
  final dynamic name;
  final dynamic price;
  final dynamic volume24h;
  final dynamic volume7d;
  final dynamic volume30d;
  final dynamic marketCap;
  final dynamic selfReportedMarketCap;
  final dynamic percentChange1h;
  final dynamic percentChange24h;
  final dynamic percentChange7d;
  final dynamic lastUpdated;
  final dynamic percentChange30d;
  final dynamic percentChange60d;
  final dynamic percentChange90d;
  final dynamic fullyDilluttedMarketCap;
  final dynamic marketCapByTotalSupply;
  final dynamic dominance;
  final dynamic turnover;
  final dynamic ytdPriceChangePercentage;
  final dynamic percentChange1y;

  Quotes({
    this.name,
    this.price,
    this.volume24h,
    this.volume7d,
    this.volume30d,
    this.marketCap,
    this.selfReportedMarketCap,
    this.percentChange1h,
    this.percentChange24h,
    this.percentChange7d,
    this.lastUpdated,
    this.percentChange30d,
    this.percentChange60d,
    this.percentChange90d,
    this.fullyDilluttedMarketCap,
    this.marketCapByTotalSupply,
    this.dominance,
    this.turnover,
    this.ytdPriceChangePercentage,
    this.percentChange1y,
  });

  Quotes.fromJson(Map<String, dynamic> json)
    : name = json['name'] as dynamic,
      price = json['price'] as dynamic,
      volume24h = json['volume24h'] as dynamic,
      volume7d = json['volume7d'] as dynamic,
      volume30d = json['volume30d'] as dynamic,
      marketCap = json['marketCap'] as dynamic,
      selfReportedMarketCap = json['selfReportedMarketCap'] as dynamic,
      percentChange1h = json['percentChange1h'] as dynamic,
      percentChange24h = json['percentChange24h'] as dynamic,
      percentChange7d = json['percentChange7d'] as dynamic,
      lastUpdated = json['lastUpdated'] as dynamic,
      percentChange30d = json['percentChange30d'] as dynamic,
      percentChange60d = json['percentChange60d'] as dynamic,
      percentChange90d = json['percentChange90d'] as dynamic,
      fullyDilluttedMarketCap = json['fullyDilluttedMarketCap'] as dynamic,
      marketCapByTotalSupply = json['marketCapByTotalSupply'] as dynamic,
      dominance = json['dominance'] as dynamic,
      turnover = json['turnover'] as dynamic,
      ytdPriceChangePercentage = json['ytdPriceChangePercentage'] as dynamic,
      percentChange1y = json[' percentChange1y'] as dynamic;

  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
    'volume24h': volume24h,
    'volume7d': volume7d,
    'volume30d': volume30d,
    'marketCap': marketCap,
    'selfReportedMarketCap': selfReportedMarketCap,
    'percentChange1h': percentChange1h,
    'percentChange24h': percentChange24h,
    'percentChange7d': percentChange7d,
    'lastUpdated': lastUpdated,
    'percentChange30d': percentChange30d,
    'percentChange60d': percentChange60d,
    'percentChange90d': percentChange90d,
    'fullyDilluttedMarketCap': fullyDilluttedMarketCap,
    'marketCapByTotalSupply': marketCapByTotalSupply,
    'dominance': dominance,
    'turnover': turnover,
    'ytdPriceChangePercentage': ytdPriceChangePercentage,
    ' percentChange1y': percentChange1y,
  };
}
