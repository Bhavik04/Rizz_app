import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/features/auth/screens/create_age.dart';
import 'package:rizz/features/auth/screens/create_gender.dart';
import 'package:rizz/features/auth/screens/create_photo.dart';
import 'package:rizz/features/auth/screens/create_profile.dart';
import 'package:rizz/features/auth/screens/create_referral.dart';
import 'package:rizz/features/auth/screens/create_username.dart';
import 'package:rizz/features/auth/screens/create_snapchat.dart';
import 'package:rizz/features/auth/screens/onboardig.dart';
import 'package:rizz/features/auth/screens/sign_in.dart';
import 'package:rizz/features/bottom_bar.dart';
import 'package:rizz/features/home/screens/ad_swipe.dart';
import 'package:rizz/features/home/screens/inbox.dart';
import 'package:rizz/features/home/screens/play.dart';
import 'package:rizz/features/home/screens/profile.dart';

class CustomNavigationHelper {
  static final CustomNavigationHelper _instance =
      CustomNavigationHelper._internal();

  static CustomNavigationHelper get instance => _instance;
  factory CustomNavigationHelper() {
    return _instance;
  }

  CustomNavigationHelper._internal() {
    // Router initialization happens here.
  }
}

class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> shellNavigatorKeyA =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> shellNavigatorKeyB =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> shellNavigatorKeyC =
      GlobalKey<NavigatorState>();

  static final GoRouter router =
      GoRouter(navigatorKey: rootNavigatorKey, initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      name: SignInPage.routeName,
      builder: (context, state) => const SignInPage(),
      routes: [
        GoRoute(
            path: 'UserNameScreen',
            name: UserNameScreen.routeName,
            builder: (context, state) => const UserNameScreen(),
            routes: [
              GoRoute(
                  path: 'SnapchatScreen',
                  name: SnapchatScreen.routeName,
                  builder: (context, state) => const SnapchatScreen(),
                  routes: [
                    GoRoute(
                        path: 'ReferralScreen',
                        name: ReferralScreen.routeName,
                        builder: (context, state) => const ReferralScreen(),
                        routes: [
                          GoRoute(
                              path: 'AgeScreen',
                              name: AgeScreen.routeName,
                              builder: (context, state) => const AgeScreen(),
                              routes: [
                                GoRoute(
                                    path: 'GenderScreen',
                                    name: GenderScreen.routeName,
                                    builder: (context, state) =>
                                        const GenderScreen(),
                                    routes: [
                                      GoRoute(
                                          path: 'PhotoScreen',
                                          name: PhotoScreen.routeName,
                                          builder: (context, state) =>
                                              const PhotoScreen(),
                                          routes: [
                                            GoRoute(
                                                path: 'CreateProfileScreen',
                                                name: CreateProfileScreen
                                                    .routeName,
                                                builder: (context, state) =>
                                                    const CreateProfileScreen(),
                                                routes: [
                                                  GoRoute(
                                                    path: 'OnboardScreen',
                                                    name:
                                                        OnboardScreen.routeName,
                                                    builder: (context, state) =>
                                                        const OnboardScreen(),
                                                  ),
                                                ]),
                                          ]),
                                    ]),
                              ]),
                        ]),
                  ]),
            ]),
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: rootNavigatorKey,
          branches: [
            // Branches defined here...
            StatefulShellBranch(
              navigatorKey: shellNavigatorKeyA,
              routes: [
                GoRoute(
                  path: "PlayScreen",
                  name: PlayScreen.routeName,
                  builder: (context, state) => const PlayScreen(),
                  routes: [
                    GoRoute(
                      path: 'ProfileScreen',
                      name: ProfileScreen.routeName,
                      builder: (context, state) => const ProfileScreen(),
                    ),
                    GoRoute(
                      path: 'AdswipeScreen',
                      name: AdswipeScreen.routeName,
                      builder: (context, state) => const AdswipeScreen(),
                    ),
                  ],
                  // routes: [

                  //],

                  // pageBuilder: (context, GoRouterState state) {
                  //   return getPage(
                  //     child: const PlayScreen(),
                  //     state: state,
                  //   );
                  // },
                ),
              ],
            ),
            StatefulShellBranch(navigatorKey: shellNavigatorKeyB, routes: [
              GoRoute(
                path: "InboxScreen",
                name: InboxScreen.routeName,
                builder: (context, state) => const InboxScreen(),
              ),
            ]),
            // StatefulShellBranch(navigatorKey: shellNavigatorKeyC, routes: [
            //   GoRoute(
            //     path: "ChatScreen",
            //     name: ChatScreen.routeName,
            //     builder: (context, state) => const ChatScreen(),
            //   ),
            // ])
          ],
          builder: (context, state, navigationShell) => BottomNavigationPage(
            child: navigationShell,
          ),
        )
      ],
    ),
  ]);

  // static Page getPage({
  //   required Widget child,
  //   required GoRouterState state,
  // }) {
  //   return MaterialPage(
  //     key: state.pageKey,
  //     child: child,
  //   );
  // }
}
