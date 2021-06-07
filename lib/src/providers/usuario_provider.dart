import 'dart:convert';
import 'dart:html';

import 'package:eac/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider {
  final String _firebaseToken = 'AIzaSyAbG99hErHa9nlqjriYqztkmO3d24_1uYI';
  final _prefs = new PreferenciasUsuario();
  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    final resp = await http.post(
        Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken'),
        body: json.encode(authData));
    Map<String, dynamic> decodeResp = json.decode(resp.body);
    print(decodeResp);
    if (decodeResp.containsKey('idToken')) {
      // TODO: Salvar el token en el storage
      _prefs.token = decodeResp['idToken'];
      return {'Ok': true, 'token': decodeResp['idToken']};
    } else {
      return {'Ok': false, 'mensaje': decodeResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> nuevoUsuario(
      String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    final resp = await http.post(
        Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken'),
        body: json.encode(authData));
    Map<String, dynamic> decodeResp = json.decode(resp.body);
    print(decodeResp);
    if (decodeResp.containsKey('idToken')) {
      // TODO: Salvar el token en el storage
      _prefs.token = decodeResp['idToken'];
      return {'Ok': true, 'token': decodeResp['idToken']};
    } else {
      return {'Ok': false, 'mensaje': decodeResp['error']['message']};
    }
  }
}
