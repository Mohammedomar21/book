import 'price.dart';

class SaleInfo {
  final Price? listPrice;

  SaleInfo({this.listPrice});

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
    listPrice: json['listPrice'] is Map<String, dynamic>
        ? Price.fromJson(json['listPrice'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (listPrice != null) 'listPrice': listPrice!.toJson(),
  };
}