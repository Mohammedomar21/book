class ImageLinks {
  final String? thumbnail;
  final String? smallThumbnail;

  ImageLinks({this.thumbnail, this.smallThumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
    thumbnail: json['thumbnail'] as String?,
    smallThumbnail: json['smallThumbnail'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'thumbnail': thumbnail,
    'smallThumbnail': smallThumbnail,
  };
}