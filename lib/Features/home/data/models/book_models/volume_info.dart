import 'image_links.dart';

class VolumeInfo {
  final String? title;
  final List<String>? authors;
  final double? averageRating;
  final ImageLinks? imageLinks;

  VolumeInfo({this.title, this.authors, this.averageRating, this.imageLinks});

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
    title: json['title'] as String?,
    authors: (json['authors'] as List<dynamic>?)?.cast<String>(),
    averageRating: (json['averageRating'] is num)
        ? (json['averageRating'] as num).toDouble()
        : null,
    imageLinks: json['imageLinks'] is Map<String, dynamic>
        ? ImageLinks.fromJson(json['imageLinks'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'authors': authors,
    if (averageRating != null) 'averageRating': averageRating,
    if (imageLinks != null) 'imageLinks': imageLinks!.toJson(),
  };
}