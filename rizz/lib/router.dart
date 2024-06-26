import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/db/modals/user.dart';
import 'package:rizz/features/auth/screens/access.dart';
import 'package:rizz/features/auth/screens/create_age.dart';
import 'package:rizz/features/auth/screens/create_gender.dart';
import 'package:rizz/features/auth/screens/create_photo.dart';
import 'package:rizz/features/auth/screens/create_profile.dart';
import 'package:rizz/features/auth/screens/create_referral.dart';
import 'package:rizz/features/auth/screens/create_username.dart';
import 'package:rizz/features/auth/screens/create_snapchat.dart';
import 'package:rizz/features/auth/screens/sign_in.dart';
import 'package:rizz/features/auth/screens/splash_screen.dart';
import 'package:rizz/features/bottom_bar.dart';
import 'package:rizz/features/home/screens/ad_swipe.dart';
import 'package:rizz/features/home/screens/blurred_screen.dart';
import 'package:rizz/features/home/screens/chat.dart';
import 'package:rizz/features/home/screens/inbox.dart';
import 'package:rizz/features/home/screens/loading_screen.dart';
import 'package:rizz/features/home/screens/play.dart';
import 'package:rizz/features/home/screens/profile.dart';
import 'package:rizz/features/home/screens/revealed_screen.dart';
import 'package:rizz/features/home/screens/subscription.dart';

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

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    routes: [
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
                      path: "LoadingScreen",
                      name: LoadingScreen.routeName,
                      builder: (context, state) => const LoadingScreen(),
                    ),
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
                                          path: 'AcessScreen',
                                          name: AcessScreen.routeName,
                                          builder: (context, state) =>
                                              const AcessScreen(),
                                          routes: [
                                            GoRoute(
                                                path: 'PhotoScreen',
                                                name: PhotoScreen.routeName,
                                                builder: (context, state) =>
                                                    const PhotoScreen(),
                                                routes: [
                                                  GoRoute(
                                                      path:
                                                          'CreateProfileScreen',
                                                      name: CreateProfileScreen
                                                          .routeName,
                                                      builder: (context,
                                                              state) =>
                                                          const CreateProfileScreen(),
                                                      routes: const []),
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
                            path: 'SubscriptionScreen',
                            name: SubscriptionScreen.routeName,
                            builder: (context, state) =>
                                const SubscriptionScreen(),
                          ),
                          GoRoute(
                            path: 'AdswipeScreen',
                            name: AdswipeScreen.routeName,
                            builder: (context, state) => const AdswipeScreen(),
                          ),
                          GoRoute(
                            path: 'SplashScreen',
                            name: SplashScreen.routeName,
                            builder: (context, state) => const SplashScreen(),
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
                  StatefulShellBranch(
                      navigatorKey: shellNavigatorKeyB,
                      routes: [
                        GoRoute(
                            path: "InboxScreen",
                            name: InboxScreen.routeName,
                            builder: (context, state) => const InboxScreen(
                                  id: '',
                                ),
                            routes: [
                              GoRoute(
                                path: 'BlurredScreen',
                                name: BlurredScreen.routeName,
                                builder: (context, state) => BlurredScreen(
                                  uId: state.uri.queryParameters['uId'] ?? '',
                                  rating:
                                      state.uri.queryParameters['rating'] ?? '',
                                ),
                              ),
                              GoRoute(
                                path: 'RevealedScreen',
                                name: RevealedScreen.routeName,
                                builder: (context, state) => RevealedScreen(
                                  user: state.extra as AppUser,
                                  rating: state.uri.queryParameters["rating"] ??
                                      "7",
                                ),
                              ),
                            ]),
                      ]),
                  StatefulShellBranch(
                      navigatorKey: shellNavigatorKeyC,
                      routes: [
                        GoRoute(
                          path: "ChatScreen",
                          name: ChatScreen.routeName,
                          builder: (context, state) => const ChatScreen(
                            id: '',
                          ),
                        ),
                      ])
                ],
                builder: (context, state, navigationShell) =>
                    BottomNavigationPage(
                  child: navigationShell,
                ),
              )
            ],
          ),
        ],
      ),
    ],
  );

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
