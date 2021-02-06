import 'package:flutter/material.dart';
import 'package:flutter_app1/model/User.dart';
import 'profile.dart';

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
