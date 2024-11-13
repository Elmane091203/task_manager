import 'package:flutter/material.dart';
import 'package:task_manager/ajout_taches.dart';
import 'package:task_manager/modif_tache.dart';

class ListeDesTaches extends StatefulWidget {
  @override
  _ListeDesTachesState createState() => _ListeDesTachesState();
}

class _ListeDesTachesState extends State<ListeDesTaches> {
  List<Map<String, String>> taches = [];

  void _ajoutTache(String titre, String description) {
    setState(() {
      taches.add({'titre': titre, 'description': description});
    });
  }

  void _supprimerTache(int index) {
    setState(() {
      taches.removeAt(index);
    });
  }

  void _modifTache(int index, String titre, String description) {
    setState(() {
      taches[index] = {'titre': titre, 'description': description};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des tâches"),
        elevation: 0,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView.builder(
        itemCount: taches.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(taches[index]['titre'] ?? ""),
              subtitle: Text(taches[index]['description'] ?? ""),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      final tacheModif = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ModifTache(
                            tache: taches[index],
                          ),
                        ),
                      );
                      if (tacheModif != Null) {
                        _modifTache(index, tacheModif['titre'],
                            tacheModif['description']);
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _supprimerTache(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AjoutTache(onSave: _ajoutTache)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
