import 'package:flutter/material.dart';
import 'package:machine_test_lifosys/views/appoinment_screen.dart';
import 'package:machine_test_lifosys/views/check-in_screen.dart';
import 'package:machine_test_lifosys/views/widgets/appbar_Widget.dart';
import 'package:machine_test_lifosys/views/widgets/selected_data_pills.dart';
import 'package:provider/provider.dart';

import '../core/colors.dart';
import '../provider/main_provider.dart';
import 'widgets/search_bar.dart';
import 'widgets/side_menu.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    MainProvider mainProvider = Provider.of<MainProvider>(
      context,
      listen: false,
    );
    mainProvider.loadDoctors();
    mainProvider.loadPatients();
    mainProvider.loadTokens();
    mainProvider.searchController.addListener(mainProvider.onSearchChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffold,
      appBar: CustomAppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SideMenu(),

          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Consumer<MainProvider>(
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        const SizedBox(height: 20),
                        dataPills(),
                        SizedBox(height: 10),
                        SearchBarWidget(),

                        Visibility(
                          visible: !value.appointment && value.selectSearchBar,
                          child: appointmentWidgetMain(context),
                        ),
                        Visibility(
                          visible: value.appointment && value.selectSearchBar,
                          child: checkIn(context),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
