class TodolistModel {
  final String message;
  final bool status;

  List<ToDo> model;

  TodolistModel({
    required this.message,
    required this.status,
    required this.model,
  });

  factory TodolistModel.fromJson(Map<String, dynamic> json) {
    final templist = json["todoList"]
        .map<ToDo>(
          (todo) => ToDo(
            id: todo["id"],
            title: todo["title"],
            description: todo["description"] ?? "",
            isCompleted: todo["isCompleted"],
            createdAt: todo["createdAt"],
          ),
        )
        .toList();
    return TodolistModel(
      message: json["message"],
      status: json["status"],
      model: templist,
    );
  }
}

class ToDo {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;
  final String createdAt;

  ToDo({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdAt,
  });
}
