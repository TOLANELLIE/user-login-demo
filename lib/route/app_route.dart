import 'package:go_router/go_router.dart';
import 'package:user_login_design/views/home_page.dart';
import 'package:user_login_design/views/login_page.dart';
import 'package:user_login_design/views/pagination.dart';
import 'package:user_login_design/views/splash_page.dart';

final approute = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/login_page',
      name: 'login_page',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home_page',
      name: 'home_page',
      builder: (context, state) {
        final argument = state.extra as UserEmailPassword;
        return HomePage(argument: argument);
      },
    ),
    GoRoute(
      path: '/pagination_page',
      name: 'pagination_page',
      builder: (context, state) => const Pagination(),
    )
  ],
);
