import 'package:machine_test_lifosys/viewmodels/time_slot_model.dart';

class Doctor {
  final String id;
  final String name;
  final String? profileImage;
  final String? initials;
  final String? initialsColor;
  final String specialty;
  final String totalBookings;
  final int currentBookings;
  final int maxBookings;
  final List<TimeSlot> timeSlots;
  final String workingHours;
  final bool isActive;
  final String bookingButtonColor;

  Doctor({
    required this.id,
    required this.name,
    this.profileImage,
    this.initials,
    this.initialsColor,
    required this.specialty,
    required this.totalBookings,
    required this.currentBookings,
    required this.maxBookings,
    required this.timeSlots,
    required this.workingHours,
    required this.isActive,
    required this.bookingButtonColor,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      profileImage: json['profileImage'],
      initials: json['initials'],
      initialsColor: json['initialsColor'],
      specialty: json['specialty'],
      totalBookings: json['totalBookings'],
      currentBookings: json['currentBookings'],
      maxBookings: json['maxBookings'],
      timeSlots: (json['timeSlots'] as List)
          .map((slot) => TimeSlot.fromJson(slot))
          .toList(),
      workingHours: json['workingHours'],
      isActive: json['isActive'],
      bookingButtonColor: json['bookingButtonColor'],
    );
  }
}
