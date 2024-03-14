import 'package:flutter/material.dart';

class CategoryStatusFilterManager {
  static ValueNotifier<int> status = ValueNotifier<int>(3);

  static Future<void> setStatus(final int newStatus) async {
    status.value = newStatus;
  }
}
