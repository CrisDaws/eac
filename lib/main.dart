import 'package:eac/src/bloc/provider.dart';
import 'package:eac/src/pages/home_page.dart';
import 'package:eac/src/pages/login_page.dart';
import 'package:eac/src/pages/producto_page.dart';
import 'package:eac/src/pages/registro_page.dart';
import 'package:eac/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:flutter/material.dart';

void main() async {
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.token);
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'registro': (BuildContext context) => RegistroPage(),
          'producto': (BuildContext context) => ProductoPage(),
        },
        theme: ThemeData(primaryColor: Colors.deepPurple),
      ),
    );
  }
}
