import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:html/parser.dart';
import 'package:movie_flutter/core/http/http.dart';
import 'package:movie_flutter/util/util.dart';

export 'dart:convert' show json, jsonDecode;
export 'dart:io' show File;

export 'package:flutter/material.dart';
export 'package:flutter/services.dart' show PlatformException;

export '../models/models.dart';

abstract class BaseProvider {
  static void handleException(dynamic e, BuildContext context) {
    debugPrint(e.toString());
  }

  static bool clientValidate(BuildContext context, Response response) {
    Object? body;
    try {
      body = jsonDecode(response.body);
    } catch (e) {}

    if ((response.headers['content-type']?.contains('json') ?? false) &&
        body != null) {
      if (response.statusCode.toString()[0] == '2') {
        return true;
      }

      String message = '';

      UtilDialog.showErrorDialog(context,
          error: message, log: response.request.toString());

      return false;
    }

    UtilDialog.showErrorDialog(
      context,
      error: parseHtml(response.body),
      errorWidget: Text(parseHtml(response.body), softWrap: false),
      log: response.request.toString(),
    );

    return false;
  }

  static String parseHtml(String html) {
    var document = parse(html);
    String parsedString =
        parse(document.body?.text).documentElement?.text.trim() ?? "Error";
    String perfectString = '';

    parsedString.split('\n').map((string) {
      if (string.trim() == '') {
        return null;
      }
      return string;
    }).forEach((string) {
      if (string != null) {
        perfectString += '${string.trim()}\n';
      }
    });

    return perfectString;
  }
}
