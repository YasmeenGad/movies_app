import 'package:go_router/go_router.dart';
import 'package:movies/homePage/home_page.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
    ],
  );
}
