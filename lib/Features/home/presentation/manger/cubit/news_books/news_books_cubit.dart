import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/book_entity.dart';
import '../../../../domain/use_cases/fetch_newsed_books_use_case.dart';
part 'news_books_state.dart';

class NewsBooksCubit extends Cubit<NewsBooksState> {
  NewsBooksCubit(this.fetchNewsedBooksUseCase) : super(NewsBooksInitial());
  final FetchNewsedBooksUseCase fetchNewsedBooksUseCase;
  Future<void> fetchFeaturedBooks() async {
    emit(NewsBooksLoading());
    var result = await fetchNewsedBooksUseCase.call();
    result.fold(
      (failure) => {emit(NewsBooksFailure(errMessage: failure.message))},
      (books) => {emit(NewsBooksSuccess(books))},
    );
  }
}
