import 'package:flutter/material.dart';

class CategoryStatusFilterManager {
  static ValueNotifier<int> status = ValueNotifier<int>(3);

  static void setStatus(int newStatus) {
    status.value = newStatus;
  }
}
