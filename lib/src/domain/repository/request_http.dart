import 'package:bex_app_flutter/src/core/global/enviroment.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class HttpService {
  HttpService._internal();

  factory HttpService() {
    return _instance;
  }

  static final HttpService _instance = HttpService._internal();

  Future<http.Response> get() async {
    http.Response response;
    HttpOverrides.global = DevHttpOverrides();
    response = await http.get(Uri.parse(RutasUsuario.apiUrl));
    return response;
  }
}

class DevHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
