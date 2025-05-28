import 'image_links.dart';
import 'industry_identifier.dart';
import 'panelization_summary.dart';
import 'reading_modes.dart';

class VolumeInfo {
  final String title;
  final String? subtitle;
  final List<String> authors;
  final String? publisher;
  final String? publishedDate;
  final List<IndustryIdentifier> industryIdentifiers;
  final ReadingModes readingModes;
  final int? pageCount;
  final String? printType;
  final List<String> categories;
  final String? maturityRating;
  final bool allowAnonLogging;
  final String? contentVersion;
  final PanelizationSummary? panelizationSummary;
  final ImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  VolumeInfo({
    required this.title,
    this.subtitle,
    required this.authors,
    this.publisher,
    this.publishedDate,
    required this.industryIdentifiers,
    required this.readingModes,
    this.pageCount,
    this.printType,
    required this.categories,
    this.maturityRating,
    required this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
    title: json['title'] ?? '',
    subtitle: json['subtitle'],
    authors: json['authors'] != null ? List<String>.from(json['authors'].whereType<String>()) : [],
    publisher: json['publisher'],
    publishedDate: json['publishedDate'],
    industryIdentifiers: json['industryIdentifiers'] != null
        ? List<IndustryIdentifier>.from((json['industryIdentifiers'] as List).map((x) => IndustryIdentifier.fromJson(x)))
        : [],
    readingModes: ReadingModes.fromJson(json['readingModes'] ?? {}),
    pageCount: json['pageCount'],
    printType: json['printType'],
    categories: json['categories'] != null ? List<String>.from(json['categories'].whereType<String>()) : [],
    maturityRating: json['maturityRating'],
    allowAnonLogging: json['allowAnonLogging'] ?? false,
    contentVersion: json['contentVersion'],
    panelizationSummary: json['panelizationSummary'] != null ? PanelizationSummary.fromJson(json['panelizationSummary']) : null,
    imageLinks: json['imageLinks'] != null ? ImageLinks.fromJson(json['imageLinks']) : null,
    language: json['language'],
    previewLink: json['previewLink'],
    infoLink: json['infoLink'],
    canonicalVolumeLink: json['canonicalVolumeLink'],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    if (subtitle != null) 'subtitle': subtitle,
    'authors': authors,
    if (publisher != null) 'publisher': publisher,
    if (publishedDate != null) 'publishedDate': publishedDate,
    'industryIdentifiers': industryIdentifiers.map((x) => x.toJson()).toList(),
    'readingModes': readingModes.toJson(),
    if (pageCount != null) 'pageCount': pageCount,
    if (printType != null) 'printType': printType,
    'categories': categories,
    if (maturityRating != null) 'maturityRating': maturityRating,
    'allowAnonLogging': allowAnonLogging,
    if (contentVersion != null) 'contentVersion': contentVersion,
    if (panelizationSummary != null) 'panelizationSummary': panelizationSummary!.toJson(),
    if (imageLinks != null) 'imageLinks': imageLinks!.toJson(),
    if (language != null) 'language': language,
    if (previewLink != null) 'previewLink': previewLink,
    if (infoLink != null) 'infoLink': infoLink,
    if (canonicalVolumeLink != null) 'canonicalVolumeLink': canonicalVolumeLink,
  };
}