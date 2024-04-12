extension StringExtension on String{
  String capitalize() {
    if(isEmpty || this == null)
      return "";
    if(length == 1)
      return this[0].toUpperCase();
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}