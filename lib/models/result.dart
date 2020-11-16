import 'package:flutter/material.dart';

class Result<T> {
  final T value;
  final bool success;
  final String errorMessage;

  Result({
    @required this.value,
    @required this.success,
    @required this.errorMessage,
  });
}
