import 'package:books/Features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';
import '../../Features/home/presentation/views/book_details_view.dart';
import '../../Features/search/presentation/views/search_view.dart';
import '../../Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kSearchView = '/SearchView';
  static const kHomeView = '/HomeView';
  static const kBookDetailsView = '/BookDetailsView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kBookDetailsView,
      builder: (context, state) => const BookDetailsView(),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => const SearchView(),
    ),
  ]);
}
