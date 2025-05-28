import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';
import 'fetch_featured_books_use_case.dart';

class FetchNewsedBooksUseCase extends UseCase<List<BookEntity>,NoParam>
{
  final HomeRepo homeRepo;
  FetchNewsedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure,List<BookEntity>>> call([NoParam? param]) async {
   return await homeRepo.fetchNewsBooks();
  }
}