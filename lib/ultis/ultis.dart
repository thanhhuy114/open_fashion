import 'package:intl/intl.dart';

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
