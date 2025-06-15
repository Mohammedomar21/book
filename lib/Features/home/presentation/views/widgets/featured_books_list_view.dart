import 'package:books/Features/home/domain/entities/book_entity.dart';
import 'package:books/Features/home/presentation/manger/cubit/featured_books_cubit/featured_books__cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  final ScrollController _scrollController=ScrollController();
  @override
  void initState()
  {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }
  void _scrollListener(){
    if(_scrollController.position.pixels>=0.7*_scrollController.position.maxScrollExtent)
      {
        BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
      }
  }
  @override

  Widget build(BuildContext context) {
    if (widget.books.isEmpty) {
      return Center(child: Text('لا توجد كتب متاحة حالياً'));
    } else {
      return SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: CustomBookImage(image: widget.books[index].image ?? ''),
            );
          },
        ),
      );
    }
  }
}
