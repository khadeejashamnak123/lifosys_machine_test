class PatientModel {
  final String id;
  final String name;
  final String? profileImage;
  final String patientId;
  final String phoneNumber;
  final String status;
  final String? checkInTime;
  final int? appointmentCount;
  final bool isBooked;
  final String? initials;
  final String? initialsColor;
  final String? lastVisit;
  final String? bookingStatus;

  PatientModel({
    required this.id,
    required this.name,
    this.profileImage,
    required this.patientId,
    required this.phoneNumber,
    required this.status,
    this.checkInTime,
    this.appointmentCount,
    required this.isBooked,
    this.initials,
    this.initialsColor,
    this.lastVisit,
    this.bookingStatus,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      name: json['name'],
      profileImage: json['profileImage'],
      patientId: json['patientId'],
      phoneNumber: json['phoneNumber'],
      status: json['status'],
      checkInTime: json['checkInTime'],
      appointmentCount: json['appointmentCount'],
      isBooked: json['isBooked'] ?? false,
      initials: json['initials'],
      initialsColor: json['initialsColor'],
      lastVisit: json['lastVisit'],
      bookingStatus: json['bookingStatus'],
    );
  }
}
