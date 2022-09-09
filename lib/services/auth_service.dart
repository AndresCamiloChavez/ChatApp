import 'dart:convert';

import 'package:chat_app/global/enviroment.dart';
import 'package:chat_app/models/login_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/usuario.dart';
class AuthService with ChangeNotifier {
  Usuario? usuario;
  bool _autenticando = false;
  bool get autenticando => _autenticando;
  set autenticando(bool valor){
    _autenticando = valor;
    notifyListeners(); 
  }
  Future login(String email, String password) async {
    autenticando = true;
    final Map<String , String> data = {
      'email': email,
      'password': password
    };
    final res = await http.post(Uri.parse('${Enviroment.apiUrl}/login/',), body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    await Future.delayed(Duration(seconds: 2));
    print('LOG login ${ res.body }');
    if(res.statusCode == 200){
      final loginResponse = loginResponseFromJson(res.body);
      usuario = loginResponse.usuario;
    }
    autenticando = false;


  }
}