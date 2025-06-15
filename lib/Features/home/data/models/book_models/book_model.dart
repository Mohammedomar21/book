import 'package:books/Features/home/domain/entities/book_entity.dart';

import 'access_info.dart';
import 'sale_info.dart';
import 'search_info.dart';
import 'volume_info.dart';

class BookModel extends BookEntity {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo? volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;
  final SearchInfo? searchInfo;

  BookModel({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
    this.searchInfo,
  }) : super(
    image: volumeInfo?.imageLinks?.thumbnail ?? '',
    title: volumeInfo?.title ?? 'No Title',
    authorName: (volumeInfo?.authors?.isNotEmpty ?? false)
        ? volumeInfo!.authors!.first
        : 'Unknown Author',
    price: saleInfo?.listPrice?.amount?.toDouble() ?? 0.0,
    rating: volumeInfo?.averageRating?.toDouble() ?? 0.0,
    bookId: id ?? '',
  );

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    kind: json['kind'] as String?,
    id: json['id'] as String?,
    etag: json['etag'] as String?,
    selfLink: json['selfLink'] as String?,
    volumeInfo: json['volumeInfo'] is Map<String, dynamic>
        ? VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>)
        : null,
    saleInfo: json['saleInfo'] is Map<String, dynamic>
        ? SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>)
        : null,
    accessInfo: json['accessInfo'] is Map<String, dynamic>
        ? AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>)
        : null,
    searchInfo: json['searchInfo'] is Map<String, dynamic>
        ? SearchInfo.fromJson(json['searchInfo'] as Map<String, dynamic>)
        : null,
  );

  Map<String, dynamic> toJson() => {
    'kind': kind,
    'id': id,
    'etag': etag,
    'selfLink': selfLink,
    if (volumeInfo != null) 'volumeInfo': volumeInfo!.toJson(),
    if (saleInfo != null) 'saleInfo': saleInfo!.toJson(),
    if (accessInfo != null) 'accessInfo': accessInfo!.toJson(),
    if (searchInfo != null) 'searchInfo': searchInfo!.toJson(),
  };
}











