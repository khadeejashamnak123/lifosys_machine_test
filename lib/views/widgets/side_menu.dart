import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool isExpanded = false;
  int selectedIndex = 0;

  final List<Map<String, dynamic>> menuItems = [
    {"icon": "assets/images/home.png", "label": "Home"},
    {"icon": "assets/images/clipboard.png", "label": "Appointments"},
    {"icon": "assets/images/doctors.png", "label": "Doctors"},
    {"icon": "assets/images/patient.png", "label": "Patients"},
    {"icon": "assets/images/bills.png", "label": "Bills"},
  ];

  void _navigateTo(int index) {
    switch (index) {
      case 0:
        Navigator.pop(context);
        break;
      case 1:
        Navigator.pop(context);
        break;
      default:
        Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: isExpanded ? 200 : 70,
      color: Colors.white,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                isExpanded
                    ? Icons.keyboard_double_arrow_left
                    : Icons.keyboard_double_arrow_right,
                color: Colors.grey[700],
              ),
              onPressed: () {
                setState(() => isExpanded = !isExpanded);
              },
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                final bool isSelected = index == selectedIndex;

                return InkWell(
                  onTap: () {
                    setState(() => selectedIndex = index);
                    _navigateTo(index);
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Container(
                          width: 4,
                          height: 50,
                          color: isSelected ? Colors.pink : Colors.transparent,
                        ),

                        Expanded(
                          child: ListTile(
                            leading: Image.asset(
                              item["icon"],
                              scale: 2,
                              color: isSelected ? Colors.pink : Colors.grey[600],
                            ),
                            title: isExpanded
                                ? Text(
                              item["label"],
                              style: TextStyle(
                                fontSize: 14,
                                color: isSelected
                                    ? Colors.pink
                                    : Colors.black,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
