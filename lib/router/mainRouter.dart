import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nomadely/features/home/view/homePage.dart';
import 'package:nomadely/features/explore/view/explorePage.dart';
import 'package:nomadely/features/tour/view/tourPage.dart';
import 'package:nomadely/features/community/view/communityPage.dart';
import 'package:nomadely/features/profile/view/profilePage.dart';
import 'package:nomadely/core/widgets/navIconWidget.dart';
import 'package:nomadely/navigation/bottomNav.dart';

/// GoRouter 설정
final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return BottomNavScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HomePage()),
        ),
        GoRoute(
          path: '/explore',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ExplorePage()),
        ),
        GoRoute(
          path: '/tour',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: TourPage()),
        ),
        GoRoute(
          path: '/community',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: CommunityPage()),
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ProfilePage()),
        ),
      ],
    ),
  ],
);
