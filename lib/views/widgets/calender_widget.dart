import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:machine_test_lifosys/provider/main_provider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../viewmodels/event_model.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainProvider>();

    return Column(
      children: [
        // --- Header with Month and Arrows ---
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              const SizedBox(width: 18),
              Text(
                provider.getMonthName(provider.focusedDay),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: provider.previousMonth,
                child: const Icon(Icons.chevron_left, color: Colors.black, size: 18),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: provider.nextMonth,
                child: const Icon(Icons.chevron_right, color: Colors.black, size: 18),
              ),
              const Spacer(),
            ],
          ),
        ),

        TableCalendar<Event>(
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: provider.focusedDay,
          calendarFormat: provider.calendarFormat,
          rangeSelectionMode: provider.rangeSelectionMode,
          eventLoader: (day) => [],
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerVisible: false,
          calendarStyle: CalendarStyle(
            cellAlignment: Alignment.topLeft,
            outsideDaysVisible: true,
            weekendTextStyle: const TextStyle(
              color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w400,
            ),
            defaultTextStyle: const TextStyle(
              color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w400,
            ),
            outsideTextStyle: const TextStyle(
              color: Colors.black26, fontSize: 16, fontWeight: FontWeight.w400,
            ),
            selectedDecoration: BoxDecoration(
              border: Border.all(color: Colors.black87, width: 2),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(6),
            ),
            selectedTextStyle: const TextStyle(
              color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w400,
            ),
            todayDecoration: const BoxDecoration(color: Colors.transparent),
            todayTextStyle: const TextStyle(
              color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w400,
            ),
            markersMaxCount: 0,
            cellMargin: const EdgeInsets.all(1),
            cellPadding: const EdgeInsets.all(5),
            tablePadding: const EdgeInsets.all(0),
            tableBorder: TableBorder.all(
              color: Colors.grey.shade200, width: 0.5,
            ),
          ),
          daysOfWeekHeight: 40,
          rowHeight: 90,
          daysOfWeekStyle: DaysOfWeekStyle(
            dowTextFormatter: (date, locale) =>
                DateFormat.E(locale).format(date).toUpperCase(),
            weekdayStyle: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black54,
            ),
            weekendStyle: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black54,
            ),
          ),
          selectedDayPredicate: (day) => isSameDay(provider.selectedDay, day),
          rangeStartDay: provider.rangeStart,
          rangeEndDay: provider.rangeEnd,
          onDaySelected: provider.onDaySelected,
          onRangeSelected: provider.onRangeSelected,
          onFormatChanged: provider.onFormatChanged,
          onPageChanged: provider.onPageChanged,
        ),
      ],
    );
  }
}
