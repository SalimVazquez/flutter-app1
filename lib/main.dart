import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'AppRoot',
    initialRoute: '/',
    routes: {
      '/': (context) => Welcome(),
      '/login': (context) => Login(),
      '/index': (context) => Index(),
      Profile.routeName: (context) => Profile()
    },
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

class Index extends StatelessWidget {
  final entries = List<String>.generate(10, (index) => "# $index");
  final List<int> colorCodes = <int>[
    900,
    900,
    800,
    800,
    700,
    700,
    600,
    600,
    400,
    400
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AppRoot'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(240, 94, 100, 1),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.red[colorCodes[index]])),
              onPressed: () {
                Navigator.pushNamed(context, Profile.routeName,
                    arguments: ScreenArguments(entries[index].toString()));
                // return Scaffold.of(context).showSnackBar(
                //     SnackBar(content: Text('Clicked ${entries[index]}')));
              },
              icon: Icon(Icons.people, size: 20),
              label: Text(
                'Item ${entries[index]}',
                style: TextStyle(fontSize: 20),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));
  }
}

class Profile extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('AppRoot'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(240, 94, 100, 1),
      ),
      body: Center(
        child: Text('User: ' + args.username),
      ),
    );
  }
}

class ScreenArguments {
  final String username;

  ScreenArguments(this.username);
}
