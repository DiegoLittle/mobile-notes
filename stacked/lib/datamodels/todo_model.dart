class TodoItemModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoItemModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed
  });

  TodoItemModel.fromJson(Map<String, dynamic> map)
      : userId = map['userId'],
        id = map['id'],
        title = map['title'],
        completed = map['completed'];
      }