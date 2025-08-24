import 'package:flutter/material.dart';
import 'package:nomadely/features/home/view/weeklyCalendar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [WeeklyCalendar()],
      ),
    );
  }
}
