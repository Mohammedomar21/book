class Pdf {
  final bool isAvailable;
  final String? acsTokenLink;

  Pdf({required this.isAvailable, this.acsTokenLink});

  factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
    isAvailable: json['isAvailable'],
    acsTokenLink: json['acsTokenLink'],
  );

  Map<String, dynamic> toJson() => {
    'isAvailable': isAvailable,
    if (acsTokenLink != null) 'acsTokenLink': acsTokenLink,
  };
}