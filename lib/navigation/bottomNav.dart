import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nomadely/core/widgets/navIconWidget.dart';

class BottomNavScaffold extends StatelessWidget {
  const BottomNavScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    int currentIndex = 0;
    if (location.startsWith('/home')) currentIndex = 0;
    if (location.startsWith('/explore')) currentIndex = 1;
    if (location.startsWith('/tour')) currentIndex = 2;
    if (location.startsWith('/community')) currentIndex = 3;
    if (location.startsWith('/profile')) currentIndex = 4;

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/home');
              break;
            case 1:
              context.go('/explore');
              break;
            case 2:
              context.go('/tour');
              break;
            case 3:
              context.go('/community');
              break;
            case 4:
              context.go('/profile');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: NavIconWidget(assetName: 'assets/icons/navigation/home.svg'),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: NavIconWidget(assetName: 'assets/icons/navigation/explore.svg'),
            label: "지역체험",
          ),
          BottomNavigationBarItem(
            icon: NavIconWidget(assetName: 'assets/icons/navigation/tour.svg'),
            label: "관광",
          ),
          BottomNavigationBarItem(
            icon: NavIconWidget(assetName: 'assets/icons/navigation/community.svg'),
            label: "커뮤니티",
          ),
          BottomNavigationBarItem(
            icon: NavIconWidget(assetName: 'assets/icons/navigation/profile.svg'),
            label: "마이",
          ),
        ],
      ),
    );
  }
}