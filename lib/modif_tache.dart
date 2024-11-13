import 'package:flutter/material.dart';

class ModifTache extends StatefulWidget {
  final Map<String, String> tache;

  ModifTache({required this.tache});

  @override
  _ModifTacheState createState() => _ModifTacheState();
}

class _ModifTacheState extends State<ModifTache> {
  late TextEditingController _titreController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titreController = TextEditingController(text: widget.tache['titre']);
    _descriptionController =
        TextEditingController(text: widget.tache['description']);
  }

  void _modifTache() {
    if (!(_titreController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _descriptionController.text == "" ||
        _titreController.text == "")) {
      Navigator.pop(
        context,
        {
          'titre': _titreController.text,
          'description': _descriptionController.text,
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          width: 300,
          backgroundColor: Theme.of(context).colorScheme.error,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          behavior: SnackBarBehavior.floating,
          content: const Text("Veuillez remplir tous les champs!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modifier la tâche"),
        elevation: 0,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextField(
              controller: _titreController,
              decoration: InputDecoration(
                labelText: "Titre",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: _modifTache,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text("Enregistrer"),
            ),
          ],
        ),
      ),
    );
  }
}
