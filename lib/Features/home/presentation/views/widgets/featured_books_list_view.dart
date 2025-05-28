import 'package:books/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    if(books.isEmpty)
      {
        return   Center(child: Text('لا توجد كتب متاحة حالياً'));
      }
    else {
      return SizedBox(
      height: MediaQuery.of(context).size.height * .28,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return  Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: CustomBookImage(image:books[index].image ?? '' ,),
          );
        },
      ),
    );
    }
  }
}
