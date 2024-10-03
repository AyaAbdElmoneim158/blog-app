import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AppHelperFunctions {
  AppHelperFunctions._();

  static void showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(content)),
      );
  }

  static Future<File?> pickImage() async {
    try {
      final xFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (xFile != null) {
        return File(xFile.path);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static String formatDateBydMMMYYYY(DateTime dateTime) {
    return DateFormat("d MMM, yyyy").format(dateTime);
  }

  static int calculateReadingTime(String content) {
    final wordCount = content.split(RegExp(r'\s+')).length;
    final readingTime = wordCount / 225;
    return readingTime.ceil();
  }
}
