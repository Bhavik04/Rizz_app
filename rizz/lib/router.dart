import 'package:go_router/go_router.dart';
import 'package:rizz/features/auth/screens/create_age.dart';
import 'package:rizz/features/auth/screens/create_gender.dart';
import 'package:rizz/features/auth/screens/create_photo.dart';
import 'package:rizz/features/auth/screens/create_referral.dart';
import 'package:rizz/features/auth/screens/create_state.dart';
import 'package:rizz/features/auth/screens/create_username.dart';
import 'package:rizz/features/auth/screens/create_snapchat.dart';
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
        GoRoute(
          path: 'SnapchatScreen',
          name: SnapchatScreen.routeName,
          builder: (context, state) => const SnapchatScreen(),
        ),
        GoRoute(
          path: 'ReferralScreen',
          name: ReferralScreen.routeName,
          builder: (context, state) => const ReferralScreen(),
        ),
        GoRoute(
          path: 'AgeScreen',
          name: AgeScreen.routeName,
          builder: (context, state) => const AgeScreen(),
        ),
        GoRoute(
          path: 'GenderScreen',
          name: GenderScreen.routeName,
          builder: (context, state) => const GenderScreen(),
        ),
        GoRoute(
          path: 'StateScreen',
          name: StateScreen.routeName,
          builder: (context, state) => const StateScreen(),
        ),
        GoRoute(
          path: 'PhotoScreen',
          name: PhotoScreen.routeName,
          builder: (context, state) => const PhotoScreen(),
        ),
      ],
    ),
  ]);
}
