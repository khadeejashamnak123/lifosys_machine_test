import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:machine_test_lifosys/provider/main_provider.dart';
import 'package:provider/provider.dart';

import '../core/colors.dart';

Widget checkIn(BuildContext context) {
  bool notifyPatient = true;
  final TextEditingController discountController = TextEditingController();

  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 750),
      child: Consumer<MainProvider>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderGray),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/profileIcon.png",
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      width: 40,
                                      height: 40,
                                      color: Colors.grey[300],
                                      child: const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                    ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Eleanor Pena',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: darkGray,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'ID246894 • 8459624756',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: lightGray,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Text(
                              'Notify patient',
                              style: TextStyle(fontSize: 12, color: lightGray),
                            ),
                            const SizedBox(width: 8),

                            FlutterSwitch(
                              width: 60,
                              height: 30,
                              toggleSize: 24,
                              value: notifyPatient,
                              activeColor: blue,
                              inactiveColor: Colors.grey.shade400,
                              activeToggleColor: baseWhite,
                              inactiveToggleColor: baseWhite,
                              activeIcon: const Icon(
                                Icons.check,
                                color: blue,
                                size: 16,
                              ),
                              inactiveIcon: const SizedBox(),
                              onToggle: (val) {
                                notifyPatient = val;
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        bool isSmall = constraints.maxWidth < 600;
                        return Flex(
                          direction: isSmall ? Axis.vertical : Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: isSmall
                                  ? double.infinity
                                  : constraints.maxWidth / 3 - 16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Assigned Doctor',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: lightGray,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Dr. Anjali Sharma',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                            color: darkGray,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' • Cardiologist',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: lightGray,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: isSmall
                                  ? double.infinity
                                  : constraints.maxWidth / 3 - 16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Appointment',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: lightGray,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '04:30 PM, 28 July 2025',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: darkGray,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: isSmall
                                  ? double.infinity
                                  : constraints.maxWidth / 3 - 16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Queue Status',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: lightGray,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Token: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: darkGray,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '#12',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                            color: darkGray,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    value.checkInConfirmed
                        ? LayoutBuilder(
                            builder: (context, constraints) {
                              bool isSmall = constraints.maxWidth < 600;
                              return Flex(
                                direction: isSmall
                                    ? Axis.vertical
                                    : Axis.horizontal,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/payment_confirmIcon.png",
                                          scale: 2,
                                        ),
                                        Text(
                                          "Check-In Confirmed!",
                                          style: TextStyle(color: black),
                                        ),
                                        Text(
                                          "Robert Fox has been successfully checked in.",
                                          style: TextStyle(color: grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        :
                          // Fees and discount row
                          LayoutBuilder(
                            builder: (context, constraints) {
                              bool isSmall = constraints.maxWidth < 600;
                              return Flex(
                                direction: isSmall
                                    ? Axis.vertical
                                    : Axis.horizontal,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: isSmall ? double.infinity : 180,
                                    // height: 100,
                                    padding: const EdgeInsets.all(12),
                                    margin: EdgeInsets.only(
                                      bottom: isSmall ? 5 : 0,
                                      right: isSmall ? 0 : 24,
                                    ),
                                    decoration: BoxDecoration(
                                      color: bgGray,
                                      border: Border.all(color: borderGray),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Consultation Fee',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: lightGray,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          '350',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            color: darkGray,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: isSmall ? double.infinity : 260,
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: bgGray,
                                      border: Border.all(color: borderGray),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Discount (Optional)',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: lightGray,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // TextField with equal width
                                            Expanded(
                                              child: SizedBox(
                                                height: 40,
                                                child: TextField(
                                                  controller:
                                                      discountController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: lightGray,
                                                  ),
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    contentPadding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 8,
                                                          vertical: 8,
                                                        ),
                                                    hintText: 'eg: 50',
                                                    hintStyle: const TextStyle(
                                                      color: Color(0xFF9CA3AF),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            6,
                                                          ),
                                                      borderSide: BorderSide(
                                                        color: borderGray,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                6,
                                                              ),
                                                          borderSide:
                                                              BorderSide(
                                                                color:
                                                                    pinkColor,
                                                              ),
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            // DropdownButton with same width and height
                                            Container(
                                              height: 30,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                  ),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: borderGray,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Referral',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: lightGray,
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    size: 12,
                                                    color: lightGray,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                    const SizedBox(height: 24),
                    // Payment row
                    Visibility(
                      visible: !value.checkInConfirmed,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: borderGray),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            bool isSmall = constraints.maxWidth < 600;
                            return Flex(
                              direction: isSmall
                                  ? Axis.vertical
                                  : Axis.horizontal,
                              children: [
                                _paymentItem(
                                  title: 'Amount outstanding',
                                  amount: '350',
                                  amountColor: pinkColor,
                                  borderRight: !isSmall,
                                  borderBottom: isSmall,
                                  borderColor: borderGray,
                                ),
                                _paymentItem(
                                  title: 'Cash',
                                  amount: '0.00',
                                  borderRight: !isSmall,
                                  borderBottom: isSmall,
                                  borderColor: borderGray,
                                ),
                                _paymentItem(
                                  title: 'Card',
                                  amount: '0.00',
                                  borderRight: !isSmall,
                                  borderBottom: isSmall,
                                  borderColor: borderGray,
                                ),
                                _paymentItem(
                                  title: 'UPI',
                                  amount: '0.00',
                                  borderRight: false,
                                  borderBottom: false,
                                  borderColor: borderGray,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Buttons row
                    !value.checkInConfirmed
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: darkGray),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                ),
                                child: const Text(
                                  'Pay Later',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: darkGray,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              ElevatedButton(
                                onPressed: () {
                                  value.confirmCheckIn();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: pinkColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                ),
                                child: const Text(
                                  'Confirm Check-In',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  value.clearSearch();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: pinkColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/PrinterIcon.png",
                                      scale: 2,
                                    ),
                                    const Text(
                                      'Print Bill',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}

Widget _paymentItem({
  required String title,
  required String amount,
  Color amountColor = Colors.black,
  bool borderRight = true,
  bool borderBottom = false,
  required Color borderColor,
}) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        border: Border(
          right: borderRight ? BorderSide(color: borderColor) : BorderSide.none,
          bottom: borderBottom
              ? BorderSide(color: borderColor)
              : BorderSide.none,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF6B7280),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            amount,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: amountColor,
            ),
          ),
        ],
      ),
    ),
  );
}
