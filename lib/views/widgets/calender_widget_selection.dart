import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:machine_test_lifosys/provider/main_provider.dart';
import 'package:machine_test_lifosys/views/widgets/time_view_widget.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/colors.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double containerWidth = constraints.maxWidth * 0.9 > 400
              ? 400
              : constraints.maxWidth * 0.9;

          return Consumer<MainProvider>(
            builder: (context, value, child) {
              return Container(
                width: containerWidth,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            value.formatHeader(value.focusedDay),
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: value.goToPreviousMonth,
                                child: const Icon(
                                  Icons.keyboard_arrow_up,
                                  size: 16,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: value.goToNextMonth,
                                child: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    TableCalendar(
                      firstDay: DateTime(2000, 1, 1),
                      lastDay: DateTime(2100, 12, 31),
                      focusedDay: value.focusedDay,
                      selectedDayPredicate: (day) =>
                          isSameDay(value.selectedDay, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        value.selectDate(selectedDay);
                        setState(() {
                          value.selectedDay = selectedDay;
                          value.focusedDay = focusedDay;
                        });
                      },
                      calendarFormat: CalendarFormat.month,
                      headerVisible: false,
                      enabledDayPredicate: (day) {
                        return !day.isBefore(
                          DateTime.now().subtract(const Duration(days: 1)),
                        );
                      },
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: textTheme.bodyMedium!.copyWith(
                          color: gray500,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        weekendStyle: textTheme.bodyMedium!.copyWith(
                          color: gray500,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        dowTextFormatter: (date, locale) {
                          switch (date.weekday) {
                            case DateTime.sunday:
                              return 'Su';
                            case DateTime.monday:
                              return 'Mo';
                            case DateTime.tuesday:
                              return 'Tu';
                            case DateTime.wednesday:
                              return 'We';
                            case DateTime.thursday:
                              return 'Th';
                            case DateTime.friday:
                              return 'Fr';
                            case DateTime.saturday:
                              return 'Sa';
                          }
                          return '';
                        },
                      ),
                      calendarStyle: CalendarStyle(
                        defaultTextStyle: textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                        weekendTextStyle: textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                        outsideTextStyle: textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: gray300,
                        ),
                        disabledTextStyle: textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: gray300,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: navy,
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        todayDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: gray300),
                        ),
                        todayTextStyle: textTheme.bodyMedium!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        cellMargin: EdgeInsets.zero,
                        cellPadding: EdgeInsets.zero,
                      ),
                      daysOfWeekHeight: 24,
                      rowHeight: 32,
                      availableGestures: AvailableGestures.none,
                    ),
                    SizedBox(height: 10),
                    Visibility(
                      visible: value.selectedToken == null,
                      child: Row(
                        children: [
                          timeViewWidget(context, "08:00am - 10:00am"),
                          SizedBox(width: 5),
                          timeViewWidget(context, "01:00pm - 08:00pm"),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
