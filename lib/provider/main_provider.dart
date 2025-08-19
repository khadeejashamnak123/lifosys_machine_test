import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../viewmodels/doctor_model.dart';
import '../viewmodels/patients_model.dart';
import '../viewmodels/token_model.dart';

class MainProvider extends ChangeNotifier {

  bool selectSearchBar=false;
  bool selectCalender=false;

  void selectSearch(){
    selectSearchBar=true;
    notifyListeners();
  }
  void clearSearch() {
    selectSearchBar=false;
      selectedDay = null;
      selectedToken=null;
      selectedDoctor=null;
      selectedPatient=null;
      selectedDate=null;

    notifyListeners();

  }
  void selectDoctorIndex(int index) {

      selectedDoctorIndex = index;
      _updateSearchText();
  }


  void _updateSearchText() {
    _isUpdatingFromSelection = true;
    String dateText = '';
    if (selectedDay != null) {
      dateText =
      '${weekdayToString(selectedDay!.weekday)} ${selectedDay!.day}';
    }
    String doctorText = selectedDoctorIndex != null
        ? doctors[selectedDoctorIndex!].name
        : '';

    if (dateText.isNotEmpty && doctorText.isNotEmpty) {
      searchController.text = '$dateText, $doctorText';
    } else if (dateText.isNotEmpty) {
      searchController.text = dateText;
    } else if (doctorText.isNotEmpty) {
      searchController.text = doctorText;
    } else {
      searchController.clear();
    }

    searchController.selection = TextSelection.fromPosition(
      TextPosition(offset: searchController.text.length),
    );

    _isUpdatingFromSelection = false;
  }

  void filterDoctorsBySearch(String values) {

    final query = searchController.text.toLowerCase();
    filteredDoctors = doctors
        .where((d) => d.name.toLowerCase().contains(query))
        .toList();
    notifyListeners();
  }
  void toggleSearchCalender(){

    selectCalender=selectCalender?false:true;
    notifyListeners();
  }
  String weekdayToString(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'MON';
      case DateTime.tuesday:
        return 'TUE';
      case DateTime.wednesday:
        return 'WED';
      case DateTime.thursday:
        return 'THU';
      case DateTime.friday:
        return 'FRI';
      case DateTime.saturday:
        return 'SAT';
      case DateTime.sunday:
        return 'SUN';
      default:
        return '';
    }
  }

  List<PatientModel> _patients = [];

  List<PatientModel> get patients => _patients;
  List<PatientModel> filteredPatients=[];
  PatientModel? selectedPatient;
  bool viewCalenderToken=false;


  List<Doctor> _doctors = [];

  List<Doctor> get doctors => _doctors;
  List<Doctor> filteredDoctors = [];
  Doctor? selectedDoctor;

  bool selectNewDate=false;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay = DateTime.now();

  int? selectedToken;
  final ScrollController scrollController = ScrollController();


  List<Token> tokens = [];
  DateTime? selectedDate;
  bool appointment=false;
  bool checkInConfirmed=false;

  Future<void> loadDoctors() async {
    final String response = await rootBundle.loadString('assets/doctor.json');
    final Map<String, dynamic> data = json.decode(response);

    _doctors = (data['doctors'] as List)
        .map((doc) => Doctor.fromJson(doc))
        .toList();

    filteredDoctors = List.from(_doctors);

    notifyListeners();
  }

  void selectDoctor(Doctor doctor){
    selectedDoctor=doctor;
    notifyListeners();
  }

  Future<void> loadPatients() async {
    final String response = await rootBundle.loadString('assets/patients.json');
    final data = json.decode(response);

    _patients = (data['patients'] as List)
        .map((json) => PatientModel.fromJson(json))
        .toList();
    filteredPatients=List.from(_patients);
    notifyListeners();
  }
  void selectPatient(PatientModel patient) {
    selectedPatient=patient;
    viewCalenderToken=true;
    notifyListeners();
  }
  Future<void> loadTokens() async {
    final String jsonString = await rootBundle.loadString('assets/tokens.json');
    final List<dynamic> jsonData = json.decode(jsonString);
      tokens = jsonData.map((e) => Token.fromJson(e)).toList();
      print("dfjsdaf" + jsonData.toString());
    notifyListeners();
  }
  void focusDayLeft() {
    focusedDay = DateTime(
      focusedDay.year,
      focusedDay.month - 1,
    );
    notifyListeners();
  }

  void focusDayRight() {
      focusedDay = DateTime(
        focusedDay.year,
        focusedDay.month + 1,
      );
      notifyListeners();
  }

  void onDaySelect() {
    selectedDay = selectedDay;
    focusedDay = focusedDay;
    notifyListeners();
  }

  closeCalenderTokenView(){
    viewCalenderToken=false;
    notifyListeners();
  }

  void selectDate(DateTime selectedDay) {
    selectedDate=selectedDay;
    notifyListeners();
  }
  void selectToken(int id) {
    selectedToken = id;
    notifyListeners();
  }
  void scrollUp() {
    double rowHeight = 80;
    scrollController.animateTo(
      (scrollController.offset - rowHeight).clamp(0, scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void scrollDown() {
    double rowHeight = 80;
    scrollController.animateTo(
      (scrollController.offset + rowHeight).clamp(0, scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void bookAppointment() {
    appointment=true;
    notifyListeners();
  }

  void confirmCheckIn() {
    checkInConfirmed=true;
    notifyListeners();
  }
  bool _isUpdatingFromSelection = false;
  final TextEditingController searchController = TextEditingController();
  int? selectedDoctorIndex;

  void onSearchChanged() {
    final query = searchController.text.toLowerCase();

    if (_isUpdatingFromSelection) {

        selectedDoctorIndex = null;
        selectedDay = null;
        filteredDoctors = doctors
            .where((d) => d.name.toLowerCase().contains(query))
            .toList();
    }
  }

  // void toggleDoctorActive(String id) {
  //   final index = _doctors.indexWhere((doc) => doc.id == id);
  //   if (index != -1) {
  //     _doctors[index] = Doctor(
  //       id: _doctors[index].id,
  //       name: _doctors[index].name,
  //       profileImage: _doctors[index].profileImage,
  //       initials: _doctors[index].initials,
  //       initialsColor: _doctors[index].initialsColor,
  //       specialty: _doctors[index].specialty,
  //       totalBookings: _doctors[index].totalBookings,
  //       currentBookings: _doctors[index].currentBookings,
  //       maxBookings: _doctors[index].maxBookings,
  //       timeSlots: _doctors[index].timeSlots,
  //       workingHours: _doctors[index].workingHours,
  //       isActive: !_doctors[index].isActive,
  //       bookingButtonColor: _doctors[index].bookingButtonColor,
  //     );
  //     notifyListeners();
  //   }
  // }

}


