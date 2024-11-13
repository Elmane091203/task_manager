import 'package:flutter/material.dart';
import 'package:task_manager/app_routes.dart';

class Acceuil extends StatelessWidget {
  Acceuil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestion des taches"),
        elevation: 0,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white30),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.initialRoute);
                },
                icon: const Icon(Icons.logout_rounded),
              ),
            ),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bienvenue sur l'application de gestion de taches",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.tachesScreen);
              },
              child: const Text("Commencer"),
            ),
          ],
        ),
      ),
    );
  }
}
