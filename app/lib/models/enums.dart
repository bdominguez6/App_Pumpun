import 'package:app/constants/theme_constants.dart';

enum AppTheme {
  red(ThemeConstants.changeToRed),
  orange(ThemeConstants.changeToOrange),
  yellow(ThemeConstants.changeToYellow),
  lime(ThemeConstants.changeToLime),
  green(ThemeConstants.changeToGreen),
  teal(ThemeConstants.changeToTeal),
  aqua(ThemeConstants.changeToAqua),
  lightBlue(ThemeConstants.changeToLightBlue),
  blue(ThemeConstants.changeToBlue),
  lavender(ThemeConstants.changeToLavender),
  violet(ThemeConstants.changeToViolet),
  pink(ThemeConstants.changeToPink);
  final Function() value;
  const AppTheme(this.value);
}

enum Record {
  none,
  liked,
  disliked,
  read,
}

enum Genre {
  scifi(0),
  romance(1),
  horror(2),
  suspense(3);
  final num value;
  const Genre(this.value);
}

var recordIcons = {
  Record.none: 0xe1f0, // do_not_touch
  Record.liked: 0xe25b, // favorite
  Record.disliked: 0xe1eb, // do_not_disturb_alt
  Record.read: 0xe0ef, //read
};
