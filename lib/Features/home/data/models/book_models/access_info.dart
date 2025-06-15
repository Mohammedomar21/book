class AccessInfo {
  final String? viewability;
  final bool? embeddable;

  AccessInfo({this.viewability, this.embeddable});

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
    viewability: json['viewability'] as String?,
    embeddable: json['embeddable'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'viewability': viewability,
    'embeddable': embeddable,
  };
}