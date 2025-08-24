import 'package:flutter/material.dart';

/// 가로 스크롤 "이번 주" 달력 (요일 → 날짜 세로 배치)
class WeeklyCalendar extends StatefulWidget {
  const WeeklyCalendar({
    super.key,
    this.startOnMonday = true,
    this.onSelect,
    this.initialSelected,
    this.itemWidth = 64,
  });

  /// 주 시작 요일 (true면 월요일, false면 일요일)
  final bool startOnMonday;

  /// 날짜 탭 콜백
  final ValueChanged<DateTime>? onSelect;

  /// 처음 선택할 날짜 (없으면 오늘)
  final DateTime? initialSelected;

  /// 각 아이템 가로 폭
  final double itemWidth;

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
    _selected = (widget.initialSelected ?? _today).toLocal();
    _weekDays = _buildThisWeek(_today, startOnMonday: widget.startOnMonday);
  }

  List<DateTime> _buildThisWeek(
    DateTime anchor, {
    required bool startOnMonday,
  }) {
    final d = DateTime(anchor.year, anchor.month, anchor.day);
    // weekday: Mon=1..Sun=7
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
    return SizedBox(
      height: 88,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: _weekDays.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final day = _weekDays[index];
          final isToday = _isSameDay(day, _today);
          final isSelected = _isSameDay(day, _selected);

          final baseBorder = Border.all(
            color: isSelected
                ? theme.colorScheme.primary
                : theme.dividerColor.withOpacity(0.5),
          );

          return GestureDetector(
            onTap: () {
              setState(() => _selected = day);
              widget.onSelect?.call(day);
            },
            child: Container(
              width: widget.itemWidth,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? theme.colorScheme.primary.withOpacity(0.1)
                    : theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(14),
                border: baseBorder,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 요일 (위) — 세로 배치
                  Text(
                    _koWeekdays[(day.weekday + 6) % 7], // 월=0, ... 일=6
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? theme.colorScheme.primary
                          : (isToday ? theme.colorScheme.primary : null),
                    ),
                  ),
                  const SizedBox(height: 6),
                  // 날짜 (아래)
                  Text(
                    '${day.day}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurface,
                    ),
                  ),
                  if (isToday) ...[
                    const SizedBox(height: 6),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
