
import 'dart:developer';

import 'package:books/Features/home/data/models/book_models/book_model.dart';
import 'package:books/core/utils/api_service.dart';
import 'package:books/core/utils/constants.dart';
import '../../../../core/utils/functions/save_box.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewsBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free=ebooks&q=programming',
    );

    List<BookEntity> books = [];
    books = getBookList(data);
    saveBoxData(books, kFeaturedBox);
    log(books as String);
    return books;
  }



  @override
  Future<List<BookEntity>> fetchNewsBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free=ebooks&Sorting=newest &q=programming',
    );
    List<BookEntity> books = [];
    books = getBookList(data);
    saveBoxData(books, kNewsBox);
    return books;
  }

  List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap) as BookEntity);
    }
    log(books as String);

    return books;
  }
}
