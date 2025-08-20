import 'package:flutter/material.dart';
import 'package:machine_test_lifosys/provider/main_provider.dart';
import 'package:machine_test_lifosys/views/widgets/calender_widget_selection.dart';
import 'package:machine_test_lifosys/views/widgets/token_widget.dart';
import 'package:provider/provider.dart';

Widget calenderTokenWidget(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.05),
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
      border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.05)),
    ),
    width: double.infinity,
    constraints: const BoxConstraints(maxWidth: 900),
    child: Consumer<MainProvider>(
      builder: (context, value, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Color(0xFF64748B)),
                    onPressed: () {
                      MainProvider mainProvider = Provider.of<MainProvider>(
                        context,
                        listen: false,
                      );
                      mainProvider.closeCalenderTokenView();
                    },
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Center(
                      child: Text(
                        value.selectedDate == null
                            ? 'Select a new date'
                            : 'Select Token & Confirm Booking',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),

            Consumer<MainProvider>(
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 0,
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final bool isWide = constraints.maxWidth > 600;

                      return isWide
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: CalendarPage()),
                                const SizedBox(width: 24),
                                Expanded(child: tokenWidget(context)),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CalendarPage(),
                                const SizedBox(height: 24),
                                tokenWidget(context),
                              ],
                            );
                    },
                  ),
                );
              },
            ),

            value.selectedToken != null
                ? Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: const Color(0xFFE5E7EB),
                          width: 1,
                        ),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        value.clearSearch();
                      },
                      child: const Text(
                        'Clear All',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Color(0xFF0B1437),
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        );
      },
    ),
  );
}
