import 'dart:developer';

import 'package:books/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:books/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:books/Features/home/domain/entities/book_entity.dart';
import 'package:books/Features/home/domain/repos/home_repo.dart';
import 'package:books/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber=0}) async {
    try {
      List<BookEntity> books=[];

      books = homeLocalDataSource.fetchFeaturedBooks();

      if (books.isEmpty) {

        return right(books);

      }
      books = await homeRemoteDataSource.fetchFeaturedBooks();


      return right(books);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
        return left(ServerFailure.fromDioError(e));
      }
      log(e.toString());
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewsBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewsBooks();
      if (books.isEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewsBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
