import 'package:go_router/go_router.dart';
import 'package:rizz/features/auth/screens/create_username.dart';
import 'package:rizz/features/auth/screens/sign_in.dart';

class AppRouter {
  static final GoRouter router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
        path: '/',
        name: SignInPage.routeName,
        builder: (context, state) => const SignInPage(),
        routes: [
          GoRoute(
            path: 'UserNameScreen',
            name: UserNameScreen.routeName,
            builder: (context, state) => const UserNameScreen(),
          ),
        ])
  ]);
}
