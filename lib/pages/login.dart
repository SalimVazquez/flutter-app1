import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final _username = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future<void> _validateForm(String username, String password) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          if (username.toString().isEmpty ||
              username == null ||
              password.toString().isEmpty ||
              password == null) {
            return AlertDialog(
              title: Text('AppRoot'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Error'),
                    Text('Es necesario ingresar los datos!'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Retry!'),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: false).pop();
                  },
                ),
              ],
            );
          } else {
            return AlertDialog(
              title: Text('AppRoot'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Hello'),
                    Text('Welcome $username'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('OK!'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/index');
                  },
                ),
              ],
            );
          }
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('AppRoot'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(240, 94, 100, 1),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(35, 205, 35, 0),
          child: TextField(
            controller: _username,
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
            padding: EdgeInsets.fromLTRB(35, 30, 35, 0),
            child: TextField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  fillColor: Colors.white,
                  hintText: "Contraseña",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0))),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
            child: ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)),
              onPressed: () {
                _validateForm(_username.text, _password.text);
              },
              icon: Icon(Icons.verified_user, size: 18),
              label: Text("Iniciar sesión"),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 150, 200, 0),
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
