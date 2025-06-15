class Price {
  final double? amount;
  final String? currencyCode;

  Price({this.amount, this.currencyCode});

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    amount: (json['amount'] is num) ? (json['amount'] as num).toDouble() : null,
    currencyCode: json['currencyCode'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'currencyCode': currencyCode,
  };
}