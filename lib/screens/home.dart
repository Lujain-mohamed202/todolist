import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/providers/todolist_provider.dart';
import 'package:todolist/widgets/custom.dart';

class Home extends StatelessWidget {
  new({super.key});

  final title = TextEditingController();
  final desc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = context.read<TodolistProvider>();
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Consumer<TodolistProvider>(
        builder: (context, value, child) {
          final data = value.model?.model;
          if (data == null) {
            value.get();
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  spacing: 10,
                  children: [
                    Icon(Icons.checklist, size: 30, color: Colors.white),
                    Text(
                      "TodayDo",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .center,
                    children: [
                      Text(
                        "${data.length}",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        " Tasks",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  width: 800,
                  height: 500,
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return CustomListTile(data: data[index]);
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 215, 28, 28),

        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Column(
              mainAxisSize: .min,
              spacing: 10,
              children: [
                Text(
                  "Add Task",
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(controller: title),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  onPressed: () {
                    provider.post(title: title.text, description: desc.text);
                  },
                  child: Text("Add", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add, color: const Color.fromARGB(255, 255, 252, 252)),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
//showbuttonsheet
