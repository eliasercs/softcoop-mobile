import 'package:flutter/material.dart';
import 'package:softcoop/screens/dashboard.dart';
import 'package:softcoop/screens/log_in.dart';
import 'package:softcoop/screens/settings.dart';
import 'package:softcoop/screens/trajectory.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooperativas de Chile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const LogInScreen(),
        "/dashboard": (context) => const DashBoard(),
        "/mi-coop": (context) => const TrajectoryScreen(),
        "/settings": (context) => const Settings(),
      },
    );
  }
}
