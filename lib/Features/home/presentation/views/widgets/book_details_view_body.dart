import 'package:flutter/material.dart';
import 'book_details_section.dart';
import 'custom_app_bar_book_details_view.dart';
import 'similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBarBookDetailsView(),
                BookDetailsSection(),
                Expanded(
                  child: SizedBox(
                    height: 49,
                  ),
                ),
                SimilarBooksSection()
              ],
            ),
          ),
        )
      ],
    );
  }
}
