import 'package:flutter/material.dart';
import 'package:task_manager/acceuil.dart';
import 'package:task_manager/ajout_taches.dart';
import 'package:task_manager/liste_tache.dart';
import 'package:task_manager/login.dart';
import 'package:task_manager/register.dart';

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String initialRoute = '/initialRoute';
  static const String motDePasseScreen = '/login';
  static const String accueilScreen = '/home';
  static const String inscriptionScreen = '/register';
  static const String tachesScreen = '/taches';

  static Map<String, WidgetBuilder> routes = {
    accueilScreen: (context) => Acceuil(),
    inscriptionScreen: (context) => Register(),
    // motDePasseScreen: (context) => MotDePasseScreen(),
    initialRoute: (context) => Login(),
    tachesScreen: (context) => ListeDesTaches(),
  };
}
