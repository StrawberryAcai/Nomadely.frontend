import 'package:flutter/material.dart';
import 'package:nomadely/features/community/view/communityPage.dart';
import 'package:nomadely/features/explore/view/explorePage.dart';
import 'package:nomadely/features/home/view/homePage.dart';
import 'package:nomadely/features/profile/view/profilePage.dart';
import 'package:nomadely/features/tour/view/tourPage.dart';
import 'package:nomadely/core/widgets/navIconWidget.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(), // 스와이프 막고 nav바로만 이동 가능
        children: const [
          HomePage(),
          ExplorePage(),
          TourPage(),
          CommunityPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _tabController.animateTo(index); // 탭 이동
        },
        items: const [
          BottomNavigationBarItem(
            icon: NavIconWidget(assetName: 'assets/icons/navigation/home.svg'),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: NavIconWidget(
              assetName: 'assets/icons/navigation/explore.svg',
            ),
            label: "지역체험",
          ),
          BottomNavigationBarItem(
            icon: NavIconWidget(assetName: 'assets/icons/navigation/tour.svg'),
            label: "관광",
          ),
          BottomNavigationBarItem(
            icon: NavIconWidget(
              assetName: 'assets/icons/navigation/community.svg',
            ),
            label: "커뮤니티",
          ),
          BottomNavigationBarItem(
            icon: NavIconWidget(
              assetName: 'assets/icons/navigation/profile.svg',
            ),
            label: "마이",
          ),
        ],
      ),
    );
  }
}
