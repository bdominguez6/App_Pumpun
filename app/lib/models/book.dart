class Book {
  const Book(
      {required this.title,
      required this.cover,
      required this.description,
      required this.author,
      required this.genre,
      this.amazonLink = '',
      required this.record});

  final String title;
  final String cover;
  final String description;
  final String amazonLink;
  final List<Genre> genre;
  final List<String> author;
  final Record record;
}

enum Record {
  none,
  liked,
  disliked,
  read,
}

enum Genre {
  scifi,
  romance,
  horror,
  suspense,
}
