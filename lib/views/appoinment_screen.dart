import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:machine_test_lifosys/core/colors.dart';
import 'package:machine_test_lifosys/provider/main_provider.dart';
import 'package:machine_test_lifosys/views/widgets/buildInitial_avatar.dart';
import 'package:machine_test_lifosys/views/widgets/calender_token_widget.dart';
import 'package:machine_test_lifosys/views/widgets/calender_widget.dart';
import 'package:machine_test_lifosys/views/widgets/department_widget.dart';
import 'package:machine_test_lifosys/views/widgets/patients_widget.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';


Widget appointmentWidgetMain(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return SingleChildScrollView(
    child: Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 750),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Consumer<MainProvider>(
          builder: (context, value, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                value.selectedPatient != null && value.viewCalenderToken
                    ? calenderTokenWidget(context)
                    : Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: const Color(0xFFE5E7EB),
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            child: Consumer<MainProvider>(
                              builder: (context, value, child) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: width / 2,
                                      child: TableCalendar(
                                        firstDay: DateTime.now(),
                                        lastDay: DateTime.utc(2030, 12, 31),
                                        focusedDay: value.focusedDay,
                                        calendarFormat: CalendarFormat.week,

                                        startingDayOfWeek: value.getStartingDayOfWeek(
                                          DateTime.now(),
                                        ),
                                        enabledDayPredicate: (day) {
                                          return !day.isBefore(
                                            DateTime.now().subtract(
                                              const Duration(days: 1),
                                            ),
                                          );
                                        },

                                        daysOfWeekStyle: DaysOfWeekStyle(
                                          dowTextFormatter: (date, locale) =>
                                              DateFormat.E(
                                                locale,
                                              ).format(date).toUpperCase(),

                                          weekdayStyle: const TextStyle(
                                            color: Color(0xFFE11D48),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10,
                                          ),
                                          weekendStyle: const TextStyle(
                                            color: Color(0xFFE11D48),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10,
                                          ),
                                        ),

                                        calendarStyle: CalendarStyle(
                                          todayDecoration:
                                              const BoxDecoration(),
                                          todayTextStyle: const TextStyle(
                                            color: Color(0xFF111827),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          ),
                                          selectedDecoration: BoxDecoration(
                                            color: black,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),

                                          defaultTextStyle: const TextStyle(
                                            color: Color(0xFF111827),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          ),
                                          weekendTextStyle: const TextStyle(
                                            color: Color(0xFF111827),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          ),

                                          disabledTextStyle: const TextStyle(
                                            color: Color(0xFF9CA3AF),
                                          ),
                                        ),

                                        headerVisible: false,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        value.toggleSearchCalender();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        padding: EdgeInsets.all(1),
                                        child: Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          !value.selectCalender
                              ? Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 12,
                                      ),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xFFE5E7EB),
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 28,
                                            height: 28,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFE11D48),
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.person_add,
                                              size: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          const Text(
                                            'Register new patient',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color: Color(0xFF1F2937),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    value.selectedDoctor != null
                                        ? patientsWidget(context)
                                        : SizedBox(),
                                    Consumer<MainProvider>(
                                      builder: (context, value, child) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 24,
                                            vertical: 16,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'MOST POPULAR DOCTORS',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF6366F1),
                                                ),
                                              ),
                                              const SizedBox(height: 12),
                                              if (value.filteredDoctors.isEmpty)
                                                const Text(
                                                  'No doctors found',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFF6B7280),
                                                  ),
                                                ),
                                              ...List.generate(value.filteredDoctors.length, (
                                                index,
                                              ) {
                                                final doctor = value
                                                    .filteredDoctors[index];
                                                final isSelected =
                                                    value.selectedDoctorIndex !=
                                                        null &&
                                                    value.doctors[value
                                                            .selectedDoctorIndex!] ==
                                                        doctor;
                                                return GestureDetector(
                                                  onTap: () {
                                                    final originalIndex = value
                                                        .doctors
                                                        .indexOf(doctor);
                                                    value.selectDoctorIndex(
                                                      originalIndex,
                                                    );
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                      bottom:
                                                          index ==
                                                              value
                                                                      .filteredDoctors
                                                                      .length -
                                                                  1
                                                          ? 0
                                                          : 16,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          child: Row(
                                                            children: [
                                                              if (doctor
                                                                      .profileImage !=
                                                                  null)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        20,
                                                                      ),
                                                                  child: Image.network(
                                                                    doctor
                                                                        .profileImage!,
                                                                    width: 40,
                                                                    height: 40,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    errorBuilder:
                                                                        (
                                                                          context,
                                                                          error,
                                                                          stackTrace,
                                                                        ) {
                                                                          return buildInitialsAvatar(
                                                                            doctor.initials,
                                                                            "doctor",
                                                                          );
                                                                        },
                                                                  ),
                                                                )
                                                              else
                                                                buildInitialsAvatar(
                                                                  doctor
                                                                      .initials,
                                                                  "doctor",
                                                                ),
                                                              const SizedBox(
                                                                width: 12,
                                                              ),
                                                              Flexible(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      doctor
                                                                          .name,
                                                                      style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontSize:
                                                                            14,
                                                                        color: Color(
                                                                          0xFF111827,
                                                                        ),
                                                                      ),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 2,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        RichText(
                                                                          text: TextSpan(
                                                                            style: const TextStyle(
                                                                              fontSize: 12,
                                                                              color: Color(
                                                                                0xFF6B7280,
                                                                              ),
                                                                            ),
                                                                            children: [
                                                                              TextSpan(
                                                                                text: doctor.specialty,
                                                                              ),
                                                                              const TextSpan(
                                                                                text: ' • ',
                                                                              ),
                                                                              TextSpan(
                                                                                text: doctor.totalBookings.toString(),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              2,
                                                                        ),
                                                                        if (doctor
                                                                            .workingHours
                                                                            .isNotEmpty)
                                                                          Flexible(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.symmetric(
                                                                                horizontal: 8,
                                                                                vertical: 4,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: const Color(
                                                                                  0xFFF3F4F6,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(
                                                                                  20,
                                                                                ),
                                                                              ),
                                                                              child: Text(
                                                                                doctor.workingHours,
                                                                                style: const TextStyle(
                                                                                  fontSize: 10,
                                                                                  color: Color(
                                                                                    0xFF4B5563,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            value.selectDoctor(
                                                              value
                                                                  .filteredDoctors[index],
                                                            );
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor:
                                                                const Color(
                                                                  0xFF6366F1,
                                                                ),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    20,
                                                                  ),
                                                            ),
                                                            padding:
                                                                const EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 8,
                                                                ),
                                                            minimumSize:
                                                                const Size(
                                                                  64,
                                                                  32,
                                                                ),
                                                            elevation: 0,
                                                          ),
                                                          child: const Text(
                                                            'Book',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                    // Departments
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 16,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'DEPARTMENTS',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFF59E0B),
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          DepartmentRow(
                                            icon:
                                                "assets/images/cardiology.png",
                                            iconColor: const Color(0xFFE11D48),
                                            title: 'Cardiology',
                                            subtitle: 'Floor 2, Wing A',
                                            availability:
                                                '24/38 Doctors Available',
                                          ),
                                          const SizedBox(height: 12),
                                          DepartmentRow(
                                            icon:
                                                "assets/images/orthopedic.png",
                                            iconColor: const Color(0xFFE11D48),
                                            title: 'Orthopedic',
                                            subtitle: 'Floor 2, Wing A',
                                            availability:
                                                '24/38 Doctors Available',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : CalenderWidget(),
                        ],
                      ),
              ],
            );
          },
        ),
      ),
    ),
  );
}
