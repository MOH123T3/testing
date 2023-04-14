// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var onClick;
    return MaterialApp(
      home: Scaffold(
        key: Key('scaffold'),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Flutter Unit/Widget Testing '),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            key: Key('column'),
            mainAxisAlignment: count == 0
                ? MainAxisAlignment.spaceAround
                : MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Hey Mohit",
                    key: Key('text'),
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Good ${Timer.getTimer()}",
                    key: Key('timer'),
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              TextField(
                key: Key("textField"),
                onTap: (() {}),
                controller: _controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Enter text"),
              ),
              ElevatedButton(
                  key: Key("button"),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    minimumSize:
                        MaterialStateProperty.all(Size(double.infinity, 40)),
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {},
                  child: Text("Enter"))
            ],
          ),
        ),
      ),
    );
  }
}

class Timer {
  static String getTimer() {
    DateTime dateTime = DateTime.now();
    if (dateTime.hour >= 0 && dateTime.hour < 6) return "Night";
    if (dateTime.hour >= 6 && dateTime.hour < 12) return "Morning";
    if (dateTime.hour >= 12 && dateTime.hour < 18) return "Afternoon";

    return "Evening";
  }
}
