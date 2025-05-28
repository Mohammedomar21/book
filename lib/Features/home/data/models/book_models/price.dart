class Price {
  final double amount;
  final String currencyCode;

  Price({required this.amount, required this.currencyCode});

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    amount: (json['amount'] ?? json['amountInMicros'] / 1000000).toDouble(),
    currencyCode: json['currencyCode'],
  );

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'currencyCode': currencyCode,
  };
}