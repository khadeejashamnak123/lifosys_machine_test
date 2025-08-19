import 'package:flutter/material.dart';
import 'package:machine_test_lifosys/provider/main_provider.dart';
import 'package:machine_test_lifosys/views/widgets/searchbar_panel.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  bool isExpanded = false;


  @override
  Widget build(BuildContext context) {
    return                 Center(
      child: Consumer<MainProvider>(
        builder: (context,value,child) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 700),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9999),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE91E63),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          controller: value.searchController,
                          onChanged: (values) {
                            value.filterDoctorsBySearch(values);
                          },
                          onTap: value.selectSearch,
                          decoration: InputDecoration(
                            hintText: 'Search for patients, doctors, departments, or dates',
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF9CA3AF),
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                      Visibility(
                        visible: value.selectSearchBar,
                        child: InkWell(
                          onTap: value.clearSearch,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 18,
                              color: Color(0xFF4B5563),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        }
      ),


    );
  }
}

