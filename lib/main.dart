import 'package:flutter/material.dart';
import 'package:machine_test_lifosys/provider/main_provider.dart';
import 'package:machine_test_lifosys/views/dashboard_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => MainProvider())],
      child: MaterialApp(
        title: 'OXZYGEN',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        // home: HomeScreen(),
        home: DashboardScreen(),
      ),
    );
  }
}
