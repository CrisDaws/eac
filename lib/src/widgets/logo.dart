import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String titulo;

  const Logo({Key key, @required this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Image(image: AssetImage('assets/eac.png')),
            SizedBox(height: 20),
            Text(this.titulo, style: TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }
}
