import 'package:go_router/go_router.dart';
import 'package:movies/features/home/presentation/views/home.dart';
import 'package:movies/features/search/presentation/views/widgets/movie_details.dart';

abstract class AppRouter {
  static const String movieDetails = '/movieDetails';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: movieDetails,
        builder: (context, state) => MovieDetails(),
      ),
    ],
  );
}
