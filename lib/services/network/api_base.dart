
import 'dart:io';

import 'package:flutter/material.dart';

abstract class HttpMethod {

  Future<dynamic> post(String route, dynamic body, BuildContext context,
      {dynamic type});

  Future<dynamic> get(String route, BuildContext context,
      {dynamic type});
  Future<dynamic> multipartPostRequest(
      String route, Map<String, dynamic> body, BuildContext context,
      {List<File> files});
}