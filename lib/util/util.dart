import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static NumberFormat currency = NumberFormat.simpleCurrency(decimalDigits: 0);
}

class UtilDateFormat {
  /// Return "DD/MM/YYYY"
  /// Example 30/12/2019
  static String formatDateShort(DateTime date) {
    return DateFormat('cc/MM/yyyy').format(date).toString();
  }

  /// Return "Day, DD/MM/YYYY"
  /// Example Monday, 30/12/2019
  static String formatDateLong(DateTime date) {
    return DateFormat('EEEE, cc/MM/yyyy').format(date).toString();
  }

  /// Return "cc MMMMM yyyy"
  /// Example 30 Desember 2019
  static String formatDateMonthLong(DateTime date) {
    return DateFormat('cc MMMM yyyy').format(date).toString();
  }

  /// Return "DD MMM"
  /// Example 30 Des
  static String formatDateMonth(DateTime date) {
    return DateFormat('cc MMM').format(date).toString();
  }

  /// Return "Day"
  /// Example Monday
  static String formatDay(DateTime date) {
    return DateFormat('EEEE').format(date).toString();
  }

  /// Return "HH.MM (24 Hour)"
  /// Example 19.59
  static String formatTime(DateTime time) {
    return DateFormat('HH.mm').format(time).toString();
  }

  /// Return "HH.MM.SS (24 Hour)"
  /// Example 19.59.59
  static String formatTimeSecond(DateTime time) {
    return DateFormat('HH.mm.ss').format(time).toString();
  }

  /// Return "DD/MM/YYYY HH.MM"
  /// Example 30/12/2019 19.59
  static String formatDateTimeShort(DateTime datetime) {
    return DateFormat('cc/MM/yyyy HH.mm').format(datetime).toString();
  }

  /// Return "Day, DD/MM/YYYY HH.MM.SS"
  /// Example Monday, 30/12/2019 19.59.59
  static String formatDateTimeLong(DateTime datetime) {
    return DateFormat('EEEE, cc/MM/yyyy HH.mm.ss').format(datetime).toString();
  }

  /// Return "cc MMMM yyyy HH.MM"
  /// Example 30 Desember 2019 19.59
  static String formatDateMonthLongWithTime(DateTime datetime) {
    return DateFormat('cc MMMM yyyy HH.mm').format(datetime).toString();
  }
}

class UtilDialog {
  static Future<void> showMessageDialog(
    BuildContext context, {
    required String title,
    required Widget content,
    bool barrierDismissible = true,
    bool horizontalScrollable = false,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: !horizontalScrollable
                ? content
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: content,
                  ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showErrorDialog(
    BuildContext context, {
    String? error,
    Widget? errorWidget,
    String title = 'Error',
    String? log,
    bool horizontalScrollable = false,
  }) {
    assert(error != null || errorWidget != null);

    if (log != null) {
      print('$log\n$error');
    } else {
      print(error);
    }

    return UtilDialog.showMessageDialog(
      context,
      title: title,
      content: errorWidget ?? Text(error!),
      barrierDismissible: false,
      horizontalScrollable: horizontalScrollable,
    );
  }

  static Future<dynamic> showYesNoDialog(
    BuildContext context, {
    required String title,
    required VoidCallback onOkPressed,
    String? subtitle,
    Widget? content,
    String? cancel,
    String? ok,
    bool dismissOkPressed = true,
  }) {
    assert(subtitle != null || content != null);
    assert(content == null);

    cancel ??= "Cancel";
    ok ??= "OK";

    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: subtitle != null ? Text(subtitle) : content,
            actions: <Widget>[
              TextButton(
                child: Text(cancel!),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              TextButton(
                child: Text(ok!),
                onPressed: () {
                  onOkPressed();
                  if (dismissOkPressed) Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }
}
