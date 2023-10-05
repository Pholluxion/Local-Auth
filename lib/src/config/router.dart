import 'package:go_router/go_router.dart';

import 'package:pagatodo/src/modules/auth/login/login.dart';
import 'package:pagatodo/src/modules/auth/otp/otp.dart';
import 'package:pagatodo/src/modules/home/home.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/otp',
      builder: (context, state) => const OTPEnabledPage(),
    ),
    GoRoute(
      path: '/pin',
      builder: (context, state) => const OTPPage(),
    ),
    GoRoute(
      path: '/ok',
      builder: (context, state) => const OTPCompletePage(),
    ),
    GoRoute(
      path: '/error',
      builder: (context, state) => const OTPErrorPage(),
    ),
  ],
);
