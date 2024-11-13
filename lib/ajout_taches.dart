import 'package:flutter/material.dart';

class AjoutTache extends StatefulWidget {
  final Function(String, String) onSave;

  AjoutTache({required this.onSave});

  @override
  _AjoutTacheState createState() => _AjoutTacheState();
}

class _AjoutTacheState extends State<AjoutTache> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _ajoutTache() {
    if (!(_titleController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _descriptionController.text == "" ||
        _titleController.text == "")) {
      widget.onSave(_titleController.text, _descriptionController.text);
      Navigator.pop(context);
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
        title: Text("Ajouter une tâche"),
        elevation: 0,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: _titleController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez saisir le titre.";
                  }

                  return null;
                },
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
              SizedBox(
                height: 10,
              ),
              TextFormField(
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
                onPressed: _ajoutTache,
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
      ),
    );
  }
}
