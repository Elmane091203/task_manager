import 'package:flutter/material.dart';
import 'package:task_manager/app_routes.dart';
import 'package:task_manager/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion de tache',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
        primaryColor: const Color.fromARGB(136, 112, 141, 236),
        secondaryHeaderColor: const Color.fromARGB(255, 195, 181, 219),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color.fromARGB(255, 10, 10, 10),
            fontSize: 16,
            fontWeight: FontWeight.normal,
            fontFamily: "Times New Roman",
          ),
          titleMedium: TextStyle(
            color: Colors.black,
            height: 14,
            fontSize: 14,
            fontFamily: "Times New Roman",
          ),
        ),
      ),
      home: const Login(),
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
