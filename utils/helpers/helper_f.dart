import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class THelper {
  static Color? getColor(String value) {
    if (value == 'Green') {
      return Colors.green;
    }
    else if (value == 'Red') {
      return Colors.red;
    }
    else if (value == 'Blue') {
      return Colors.blue;
    }
    else if (value == 'Orange') {
      return Colors.orange;
    }
    else if (value == 'Yellow') {
      return Colors.yellow;
    }
    else if (value == 'Grey') {
      return Colors.grey;
    }
    else if (value == 'Purple') {
      return Colors.purple;
    }
    else if (value == 'Black') {
      return Colors.black;
    }
    else if (value == 'White') {
      return Colors.white;
    }
    else if (value == 'Teal') {
      return Colors.teal;
    }
    else if (value == 'Indigo') {
      return Colors.indigo;
    }
    else {
      return null;
    }
  }

  static void showSnackBar(String msg) {
    final context = Get.context;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg)),
      );
    } else {
      // Handle the case where context is null (e.g., log an error or display a default message)
      print("Warning: Context is null. SnackBar not shown.");
    }
  }


  static void showAlert(String title, String msg) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen),);
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    else {
      return '${text.substring(0, maxLength)}....';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme
        .of(context)
        .brightness == Brightness.dark;
  }

  static Size screenSize() {
    final context = Get.context;
    if (context != null) {
      return MediaQuery.of(context).size;
    } else {
      // Handle the case where context is null (return a default size or throw an error)
      print("Warning: Context is null. Returning default size.");
      return Size(0, 0); // Replace with your default size
    }
  }

  static double screenHeight() {
    final context = Get.context;
    if (context != null) {
      return MediaQuery.of(context).size.height;
    } else {
      // Handle the case where context is null (return a default height or throw an error)
      print("Warning: Context is null. Returning default height.");
      return 0; // Replace with your default height
    }
  }

  static double screenWidth() {
    final context = Get.context;
    if (context != null) {
      return MediaQuery.of(context).size.width;
    } else {
      // Handle the case where context is null (return a default width or throw an error)
      print("Warning: Context is null. Returning default width.");
      return 0; // Replace with your default width
    }
  }


  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];

    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}


