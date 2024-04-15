enum Theme {
  light,
  dark,
  prefered,
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

var recordIcons = {
  Record.none: 0xe1f0, // do_not_touch
  Record.liked: 0xe25b, // favorite
  Record.disliked: 0xe1eb, // do_not_disturb_alt
  Record.read: 0xe0ef //read
};
