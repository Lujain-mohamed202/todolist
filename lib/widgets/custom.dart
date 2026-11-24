import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/todolist.dart';
import 'package:todolist/providers/todolist_provider.dart';

class CustomListTile extends StatelessWidget {
  final ToDo data;
  final titleController = TextEditingController();
  new({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var provider = context.read<TodolistProvider>();
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: ListTile(
        title: Text(data.title),
        trailing: Row(
          mainAxisSize: .min,
          spacing: 10,
          children: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Column(
                    mainAxisSize: .min,

                    spacing: 20,
                    children: [
                      Text(
                        "Update Task",
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(hintText: data.title),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                        ),

                        onPressed: () {
                          provider.put(
                            title: titleController.text,
                            id: data.id,
                          );
                        },
                        child: Text(
                          "Update",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.edit, color: Colors.blue),
            ),

            IconButton(
              onPressed: () {
                provider.delete(id: data.id);
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
