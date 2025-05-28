
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books/Features/home/domain/entities/book_entity.dart';
import '../../../../domain/use_cases/fetch_featured_books_use_case.dart';
part 'featured_books__state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchFeaturedBooks() async {

    emit(FeaturedBooksLoading());
    var result = await fetchFeaturedBooksUseCase.call();
    result.fold((failure) => {
      emit(FeaturedBooksFailure(errMessage: failure.message))

    }, (books) => {
      emit(FeaturedBooksSuccess(books))
    });

  }
}
