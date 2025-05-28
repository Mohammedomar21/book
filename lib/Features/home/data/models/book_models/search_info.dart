class SearchInfo {
  final String textSnippet;

  SearchInfo({required this.textSnippet});

  factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
    textSnippet: json['textSnippet'],
  );

  Map<String, dynamic> toJson() => {
    'textSnippet': textSnippet,
  };
}