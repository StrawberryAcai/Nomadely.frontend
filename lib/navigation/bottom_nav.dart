import 'package:flutter/material.dart';
import 'package:nomadely/features/community/view/community_page.dart';
import 'package:nomadely/features/explore/view/explore_page.dart';
import 'package:nomadely/features/home/view/home_page.dart';
import 'package:nomadely/features/profile/view/profile_page.dart';
import 'package:nomadely/features/tour/view/tour_page.dart';
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
    _tabController = TabController(length: 3, vsync: this);
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
          ProfilePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _tabController.animateTo(index); // 탭 이동
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "지역체험"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "관광"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "커뮤니티"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "마이"),
        ],
      ),
    );
  }
}