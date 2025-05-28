
import 'package:books/Features/home/domain/entities/book_entity.dart';
import 'package:books/core/utils/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource{
  List<BookEntity> fetchFeaturedBooks() ;
  List<BookEntity> fetchNewsBooks() ;
}
class HomeLocalDataSourceImpl extends HomeLocalDataSource
{
  @override
  List<BookEntity> fetchFeaturedBooks() {
   var box =Hive.box<BookEntity>(kFeaturedBox);
   return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewsBooks() {
    var box =Hive.box<BookEntity>(kNewsBox);
    return box.values.toList();
  }

}
