import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'book_card_list_view.dart';
import 'custom_app_bar_home_view.dart';
import 'featured_books_list_view_bloc_builder.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBarHomeView(),
              ),
              FeaturedBooksListViewBlocBuilder(),
              Padding(
                padding: EdgeInsets.only(top: 50, left: 30),
                child: Text(
                  'Best Seller',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // BookCardListView(),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BookCardListView(),
          ),
        )
      ],
    );
  }
}

