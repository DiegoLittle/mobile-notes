class Note {
  final String id;
  final String title;
  final String description;


  Note({
    required this.id,
    required this.title,
    required this.description
  });

  Note.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        description = map['description'];
      }