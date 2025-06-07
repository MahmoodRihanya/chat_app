import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  BuildContext context,
  String messege,
) {
  return ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(messege)));
}
