int dayOfMonth(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return (date.day + 1);
}

String hourOfDay(String strDate) {
  final String strHour = strDate.substring(11, 16);
  return (strHour);
}

String monthOfYear(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final monthString = monthToString(date.month);
  return monthString;
}

String monthToString(int month) {
  final months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  return months[month - 1];
}