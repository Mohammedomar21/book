import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/cubit/featured_books_cubit/featured_books__cubit.dart';
import 'featured_books_list_view.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return FeaturedBooksListView(books: state.books);
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errMessage);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
