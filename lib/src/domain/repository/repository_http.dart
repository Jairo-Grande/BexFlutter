import 'package:http/http.dart' as http;

import 'package:bex_app_flutter/src/domain/repository/request_http.dart';

class Request {
  Future<http.Response> getDataUser() async {
    final http.Response response;
    response = await HttpService().get();
    return response;
  }
}
