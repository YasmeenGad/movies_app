import 'package:go_router/go_router.dart';
import 'package:movies/features/home/presentation/views/home.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeView(),
      ),
    ],
  );
}
