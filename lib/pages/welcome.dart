import 'package:flutter/material.dart';

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
