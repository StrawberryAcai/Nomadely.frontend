import 'package:flutter/widgets.dart';

/// Gap widget
/// 높이 또는 너비만 지정해서 사용
class Gap extends StatelessWidget {
  const Gap(this.size, {super.key, this.axis = Axis.vertical});

  /// 간격 크기
  final double size;

  /// Axis.vertical = 세로 gap, Axis.horizontal = 가로 gap
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: axis == Axis.horizontal ? size : 0,
      height: axis == Axis.vertical ? size : 0,
    );
  }
}
