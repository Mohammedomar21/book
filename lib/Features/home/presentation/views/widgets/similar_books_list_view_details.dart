import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class SimilarBooksListViewDetails extends StatelessWidget {
  const SimilarBooksListViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .17,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CustomBookImage(image: '',),
          );
        },
      ),
    );
  }
}
