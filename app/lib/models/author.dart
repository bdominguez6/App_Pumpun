class Author {
  int? id;
  final String name;

  Author({this.id, required this.name});

  Author.fromMap(Map<String, dynamic> item)
      : id = item['id'],
        name = item['name'];

  Map<String, Object?> toMap() {
    return {
      'name': name,
    };
  }
}
