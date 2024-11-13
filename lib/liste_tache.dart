import 'package:flutter/material.dart';

class ListeDesTaches extends StatefulWidget {
  @override
  _ListeDesTachesState createState() => _ListeDesTachesState();
}

class _ListeDesTachesState extends State<ListeDesTaches> {
  List<Map<String, String>> tasks = [];

  void _addTask(String title, String description) {
    setState(() {
      tasks.add({'titre': title, 'description': description});
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Liste des tâches")),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(tasks[index]['title'] ?? ""),
              subtitle: Text(tasks[index]['description'] ?? ""),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Logic de modification
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteTask(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
