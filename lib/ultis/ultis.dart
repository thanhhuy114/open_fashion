import 'package:intl/intl.dart';

const iP = '192.168.1.103';
const port = 3000;

String getDatePublished(final String date) {
  final DateTime publishedDate = DateFormat('dd/MM/yyyy').parse(date);

  final DateTime today = DateTime.now();
  final int daysDifference = today.difference(publishedDate).inDays;

  if (daysDifference < 10) {
    return '$daysDifference days ago';
  } else {
    return DateFormat('dd/MM/yyyy').format(publishedDate);
  }
}
