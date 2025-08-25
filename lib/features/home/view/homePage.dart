import 'package:flutter/material.dart';
import 'package:nomadely/core/widgets/gapWidget.dart';
import 'package:nomadely/features/home/view/weeklyCalendar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            WeeklyCalendar(startOnMonday: false),
            Gap(16),
            SearchBar(),
            Gap(16),
            TextButton(onPressed: null, child: Text("Btn1")),
          ],
        ),
      ),
    );
  }
}
