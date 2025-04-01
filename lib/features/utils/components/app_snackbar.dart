import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class AppSnackbar {
  static void error(BuildContext context, {required String message}) {
    final snackbar = SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1000),
        content: AwesomeSnackbarContent(
            title: 'Error',
            message: message,
            contentType: ContentType.failure));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
  }

  static void success(BuildContext context, {required String message}) {
    final snackbar = SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1000),
        content: AwesomeSnackbarContent(
            title: 'Success',
            message: message,
            contentType: ContentType.success));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}
