import 'package:flutter/material.dart';

import 'book_card.dart';

class BookCardListView extends StatelessWidget {
  const BookCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: BookCard(),
          );
        });
  }
}
