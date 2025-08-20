import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavIconWidget extends StatelessWidget {
  final String assetName;

  const NavIconWidget({super.key, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: 24,         // 고정 스타일
      height: 24,
      colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn)
    );
  }
}
