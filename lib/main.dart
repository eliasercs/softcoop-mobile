import 'package:flutter/material.dart';
import 'package:softcoop/api/auth.dart';
import 'package:softcoop/screens/dashboard.dart';
import 'package:softcoop/screens/junta_general_socios.dart';
import 'package:softcoop/screens/log_in.dart';
import 'package:softcoop/screens/settings.dart';
import 'package:softcoop/screens/trajectory.dart';
import 'package:softcoop/services/preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Preferences();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String route = "";

  // tODO => Reparar persistencia de sesión
  @override
  void initState() {
    // TODO: implement initState
    Auth().checkToken(Preferences().authToken ?? "").then((value) {
      print(value);
      route = value ? "/dashboard" : "/";
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooperativas de Chile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: route,
      routes: {
        "/": (context) => const LogInScreen(),
        "/dashboard": (context) => const DashBoard(),
        "/mi-coop": (context) => const TrajectoryScreen(),
        "/settings": (context) => const Settings(),
        "/junta-socios": (context) => const JuntaGeneralSociosScreen()
      },
    );
  }
}
