import 'dart:io';

class Enviroment{
  static String apiUrl = Platform.isAndroid ? 'http://127.0.0.1:3000/api' : 'http://localhost:3000/api';
  static String socketUrl = Platform.isAndroid ? 'http://127.0.0.1:3000' : 'http://localhost:3000';
}