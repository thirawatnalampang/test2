import 'package:flutter/material.dart';

class Validator {
  static String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    final number = double.tryParse(value);
    if (number == null || number <= 0) {
      return 'Please enter a valid positive number';
    }
    return null;
  }
}
