import 'package:flutter/material.dart';

class WeeklyCalendar extends StatefulWidget {
  const WeeklyCalendar({
    super.key,
    this.startOnMonday = true,
    this.onSelect,
    this.initialSelected,
    this.padding = 0,
  });

  /// 주 시작 요일 (true면 월요일, false면 일요일)
  final bool startOnMonday;

  /// 날짜 탭 콜백
  final ValueChanged<DateTime>? onSelect;

  /// 처음 선택할 날짜 (없으면 오늘)
  final DateTime? initialSelected;

  final double padding;

  @override
  State<WeeklyCalendar> createState() => _WeeklyCalendarState();
}

class _WeeklyCalendarState extends State<WeeklyCalendar> {
  late DateTime _today;
  late DateTime _selected;
  late List<DateTime> _weekDays;

  static const _koWeekdays = ['월', '화', '수', '목', '금', '토', '일'];

  @override
  void initState() {
    super.initState();
    _today = DateTime.now().toLocal();
    _selected = widget.initialSelected ?? _today;
    _weekDays = _buildThisWeek(_today, startOnMonday: widget.startOnMonday);
  }

  List<DateTime> _buildThisWeek(
    DateTime anchor, {
    required bool startOnMonday,
  }) {
    final d = DateTime(anchor.year, anchor.month, anchor.day);
    int deltaToStart = startOnMonday
        ? (d.weekday - DateTime.monday)
        : (d.weekday % 7);
    final start = d.subtract(Duration(days: deltaToStart));
    return List.generate(7, (i) => start.add(Duration(days: i)));
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    
    final itemWidth = (screenWidth - 48) / 7; // 7일을 화면에 맞춤, 스크롤 없음

    return SizedBox(
      height: 88,
      child: Row(
        children: _weekDays.map((day) {
          final isToday = _isSameDay(day, _today);
          final isSelected = _isSameDay(day, _selected);

          return GestureDetector(
            onTap: () {
              setState(() => _selected = day);
              widget.onSelect?.call(day);
            },
            child: SizedBox(
              width: itemWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 오늘 요일이면 원 강조
                  Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: isToday
                        ? BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.colorScheme.primary,
                          )
                        : null,
                    child: Text(
                      _koWeekdays[(day.weekday + 6) % 7],
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isToday
                            ? theme.colorScheme.onPrimary
                            : (isSelected
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onSurface),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  // 날짜 표시
                  Text(
                    '${day.day}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
