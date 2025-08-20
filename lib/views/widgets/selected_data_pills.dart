import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:machine_test_lifosys/core/colors.dart';
import 'package:machine_test_lifosys/provider/main_provider.dart';
import 'package:provider/provider.dart';

Widget dataPills() {
  return Consumer<MainProvider>(
    builder: (context, value, child) {
      return Container(
        constraints: const BoxConstraints(maxWidth: 750),

        child: Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              !value.appointment &&
                      value.selectedDoctor != null &&
                      value.selectSearchBar
                  ? buildFilterPill('Doctor', value.selectedDoctor!.name)
                  : SizedBox(),
              !value.appointment &&
                      value.selectedPatient != null &&
                      value.selectSearchBar
                  ? buildFilterPill('Patient', value.selectedPatient!.name)
                  : SizedBox(),
              !value.appointment &&
                      value.selectedDate != null &&
                      value.selectSearchBar
                  ? buildFilterPill(
                      'Date',
                      DateFormat(
                        'd MMM',
                      ).format(value.selectedDate!).toString(),
                    )
                  : SizedBox(),
              !value.appointment &&
                      value.selectedDate != null &&
                      value.selectSearchBar &&
                      value.selectedPatient != null &&
                      value.selectedDoctor != null
                  ? SizedBox(
                      height: 50,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          value.bookAppointment();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEC286F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          minimumSize: const Size(80, 40),
                        ),
                        child: Text(
                          'Book',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: baseWhite,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      );
    },
  );
}

Widget buildFilterPill(String label, String value) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(999),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.05),
          blurRadius: 2,
          offset: Offset(0, 1),
        ),
      ],
    ),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: grey,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Icon(Icons.check, color: navy, size: 14),
        ),
        const SizedBox(width: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF1E293B),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),

        const SizedBox(width: 50),
        GestureDetector(
          onTap: () {},
          child: const Icon(Icons.close, size: 16, color: Color(0xFF64748B)),
        ),
      ],
    ),
  );
}
