import 'offer.dart';
import 'price.dart';

class SaleInfo {
  final String country;
  final String saleability;
  final bool isEbook;
  final Price listPrice;
  final Price retailPrice;
  final String buyLink;
  final List<Offer> offers;

  SaleInfo({
    required this.country,
    required this.saleability,
    required this.isEbook,
    required this.listPrice,
    required this.retailPrice,
    required this.buyLink,
    required this.offers,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
    country: json['country'],
    saleability: json['saleability'],
    isEbook: json['isEbook'],
    listPrice: Price.fromJson(json['listPrice']),
    retailPrice: Price.fromJson(json['retailPrice']),
    buyLink: json['buyLink'],
    offers: List<Offer>.from(json['offers'].map((x) => Offer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'country': country,
    'saleability': saleability,
    'isEbook': isEbook,
    'listPrice': listPrice.toJson(),
    'retailPrice': retailPrice.toJson(),
    'buyLink': buyLink,
    'offers': offers.map((x) => x.toJson()).toList(),
  };
}