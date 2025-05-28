import 'package:books/Features/home/data/repo/home_repo_impl.dart';
import 'package:books/Features/home/presentation/manger/cubit/featured_books_cubit/featured_books__cubit.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'Features/home/domain/entities/book_entity.dart';
import 'Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'Features/home/domain/use_cases/fetch_newsed_books_use_case.dart';
import 'Features/home/presentation/manger/cubit/news_books/news_books_cubit.dart';
import 'core/utils/app_router.dart';
import 'core/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/utils/functions/service_home_repo_impl.dart';
import 'core/utils/simple_bloc_observer.dart' show SimpleBlocObserver;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  serviceHomeRepoImpl();
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewsBox);
  Bloc.observer=SimpleBlocObserver();
  runApp(const BookStore());
}

class BookStore extends StatefulWidget {
  const BookStore({super.key});

  @override
  State<BookStore> createState() => _BookStoreState();
}

final getIt = GetIt.instance;

class _BookStoreState extends State<BookStore> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>()),
            )..fetchFeaturedBooks();
          },
        ),
        BlocProvider(
          create: (context) {
            return NewsBooksCubit(
              FetchNewsedBooksUseCase(getIt.get<HomeRepoImpl>()),
            );
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          //  textTheme: GoogleFonts.montserratTextTheme(),
        ),
      ),
    );
  }
}
