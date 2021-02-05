import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'AppRoot',
    initialRoute: '/',
    routes: {'/': (context) => Welcome(), '/login': (context) => Login()},
  ));
}

class Welcome extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 246, 239, 1),
      body: Center(
          child: Column(children: <Widget>[
        Padding(
            padding: EdgeInsets.all(120),
            child: Image.asset(
              "assets/images/logoUP.png",
              height: 130.0,
            )),
        Padding(
          padding: EdgeInsets.all(50),
          child: Text(
            "Tecnología para el bien común",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
        Padding(
            padding: EdgeInsets.all(50),
            child: ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              icon: Icon(Icons.play_arrow, size: 18),
              label: Text("Iniciar"),
            ))
      ])),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppRoot'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(240, 94, 100, 1),
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(35, 60, 35, 0),
          child: TextField(
            obscureText: false,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                fillColor: Colors.white,
                hintText: "Nombre de usuario",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0))),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(35, 70, 35, 0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  fillColor: Colors.white,
                  hintText: "Contraseña",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0))),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(50, 90, 50, 0),
            child: ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)),
              onPressed: () {},
              icon: Icon(Icons.verified_user, size: 18),
              label: Text("Iniciar sesión"),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 120, 150, 0),
            child: ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black)),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: Icon(Icons.arrow_back, size: 18),
              label: Text("Regresar"),
            ))
      ])),
    );
  }
}
