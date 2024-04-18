class Author {
  int? id;
  final String name;

  Author({this.id, required this.name});

  Author.fromMap(Map<String, dynamic> item)
      : id = item['id'] as int,
        name = item['name'] as String;

  Map<String, Object?> toMap() {
    return {
      'name': name,
    };
  }
}
