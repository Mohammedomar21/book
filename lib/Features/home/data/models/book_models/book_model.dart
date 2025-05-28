import 'package:books/Features/home/domain/entities/book_entity.dart';

import 'access_info.dart';
import 'sale_info.dart';
import 'search_info.dart';
import 'volume_info.dart';

class BookModel {
  final String kind;
  final String id;
  final String etag;
  final String selfLink;
  final VolumeInfo volumeInfo;
  final SaleInfo saleInfo;
  final AccessInfo accessInfo;
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
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    kind: json['kind'],
    id: json['id'],
    etag: json['etag'],
    selfLink: json['selfLink'],
    volumeInfo: VolumeInfo.fromJson(json['volumeInfo']),
    saleInfo: SaleInfo.fromJson(json['saleInfo']),
    accessInfo: AccessInfo.fromJson(json['accessInfo']),
    searchInfo: json['searchInfo'] != null ? SearchInfo.fromJson(json['searchInfo']) : null,
  );

  Map<String, dynamic> toJson() => {
    'kind': kind,
    'id': id,
    'etag': etag,
    'selfLink': selfLink,
    'volumeInfo': volumeInfo.toJson(),
    'saleInfo': saleInfo.toJson(),
    'accessInfo': accessInfo.toJson(),
    if (searchInfo != null) 'searchInfo': searchInfo!.toJson(),
  };


}
























