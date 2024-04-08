class Book {
  //TODO
  //enum Genre {}

  Book({
    required this.title,
    required this.cover,
    required this.description,
    required this.author,
    required this.genre,
    this.amazonLink = '',
  });

  final String title;
  final String cover;
  final String description;
  final String amazonLink;
  final List<String> genre;
  //final List<Genre> genre;
  final List<String> author;
}
