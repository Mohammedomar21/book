import 'price.dart';

class Offer {
  final int finskyOfferType;
  final Price listPrice;
  final Price retailPrice;
  final bool gifFable;

  Offer({
    required this.finskyOfferType,
    required this.listPrice,
    required this.retailPrice,
    required this.gifFable,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    finskyOfferType: json['finskyOfferType'],
    listPrice: Price.fromJson(json['listPrice']),
    retailPrice: Price.fromJson(json['retailPrice']),
    gifFable: json['giftable'],
  );

  Map<String, dynamic> toJson() => {
    'finskyOfferType': finskyOfferType,
    'listPrice': listPrice.toJson(),
    'retailPrice': retailPrice.toJson(),
    'giftable': gifFable,
  };
}