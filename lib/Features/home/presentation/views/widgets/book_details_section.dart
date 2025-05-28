import 'package:flutter/material.dart';

import 'books_action.dart';
import 'custom_book_image.dart';
import 'custom_text_details.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: const CustomBookImage(image: '',),
        ),
        const SizedBox(
          height: 43,
        ),
        const CustomTextDetails(),
        const Padding(
          padding: EdgeInsets.only(top: 37),
          child: BooksAction(),
        ),
      ],
    );
  }
}
