import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_manager/app_routes.dart';

class Acceuil extends StatefulWidget {
  Acceuil({super.key});

  String text = "";
  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  @override
  Widget build(BuildContext context) {
    // final TextEditingController controllerText = TextEditingController();

    void change(String value) {
      setState(() {
        widget.text = value;
        print("Valeur saisie :" + value);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.text == "" ? "Gestion des taches" : widget.text),
        elevation: 0,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white70),
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
      // backgroundColor: Theme.of(context).primaryColorDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Titre",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      change(value);
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Valider"),
                )
              ],
            ),
            const SizedBox(height: 20),
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
