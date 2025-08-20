import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SearchPanel extends StatefulWidget {
  const SearchPanel({super.key});

  @override
  State<SearchPanel> createState() => _SearchPanelState();
}

class _SearchPanelState extends State<SearchPanel> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isExpanded ? _expandedView() : _centeredSearchBar(),
    );
  }

  /// Centered search bar (initial state)
  Widget _centeredSearchBar() {
    return Center(
      child: SizedBox(
        width: 500,
        child: TextField(
          onTap: () {
            setState(() => isExpanded = true);
          },
          decoration: InputDecoration(
            prefixIcon: Container(
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.search, color: Colors.white),
            ),
            hintText: "Search for patients, doctors, departments, or dates",
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  /// Expanded panel (scrollable with calendar + results)
  Widget _expandedView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              prefixIcon: Container(
                margin: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.search, color: Colors.white),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() => isExpanded = false);
                },
              ),
              hintText: "Search for patients, doctors, departments, or dates",
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TableCalendar(
                  focusedDay: DateTime.now(),
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  calendarFormat: CalendarFormat.week,
                  headerVisible: false,
                  availableGestures: AvailableGestures.horizontalSwipe,
                ),
                const Divider(),

                ListTile(
                  leading: const Icon(Icons.person_add, color: Colors.pink),
                  title: const Text("Register new patient"),
                  onTap: () {},
                ),
                const Divider(),

                const Text(
                  "MOST POPULAR DOCTORS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10),
                _doctorTile(
                  "Brooklyn Simmons",
                  "Cardiology",
                  "12/80 Bookings",
                  ["08:00AM - 09:00AM", "04:00PM - 08:00PM"],
                ),
                _doctorTile(
                  "Cameron Williamson",
                  "Cardiology",
                  "12/80 Bookings",
                  ["08:00AM - 09:00AM"],
                ),
                _doctorTile("Devon Lane", "Cardiology", "12/80 Bookings", [
                  "09:00AM - 10:00AM",
                ]),
                const Divider(),

                const Text(
                  "DEPARTMENTS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10),
                _departmentTile(
                  "Cardiology",
                  "Floor 2, Wing A",
                  "24/38 Doctors Available",
                ),
                _departmentTile(
                  "Orthopedic",
                  "Floor 2, Wing A",
                  "24/38 Doctors Available",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _doctorTile(
    String name,
    String dept,
    String bookings,
    List<String> times,
  ) {
    return ListTile(
      leading: CircleAvatar(child: Text(name[0])),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("$dept • $bookings"),
      trailing: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Text("Book", style: TextStyle()),
      ),
    );
  }

  Widget _departmentTile(String dept, String location, String availability) {
    return ListTile(
      leading: const Icon(Icons.local_hospital, color: Colors.red),
      title: Text(dept),
      subtitle: Text(location),
      trailing: Chip(label: Text(availability)),
    );
  }
}
