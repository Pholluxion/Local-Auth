import 'package:go_router/go_router.dart';
import 'package:pagatodo/src/modules/auth/login/view/login_page.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    )
  ],
);
