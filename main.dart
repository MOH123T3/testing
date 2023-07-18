// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:demoapp/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'network_check.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Unit Test',
          ),
          backgroundColor: Colors.green,
        ),
        body: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map _source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  String string = '';
  bool isNetworkConnected = false;
  var token;

  @override
  void initState() {
    super.initState();
    getNetworkConnectivityCheck();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getLogin(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      snapshot.data.toString(),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text(
                'Error Occurred',
              ),
            );
          }
        });
  }

  Future<String> getLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    http.Response? response;
    if (isNetworkConnected != true) {
      var jsonData = {"mobile_no": "8000197796", "password": "Admin@123"};
      response = await ResponseClass.postApi(
          "https://arogyamitra.sewabhartigujarat.org/api/login", jsonData);
      LoginResponse loginResponse =
          LoginResponse.fromJson(jsonDecode(response.body));
      token = loginResponse.token;
      sharedPreferences.setString("token", token);

      progressBar(context);

      getVillage();
    }
    return response!.body;
  }

  progressBar(BuildContext context) {
    return CircularProgressIndicator();
  }

  Future<String> getVillage() async {
    http.Response? response;
    if (isNetworkConnected != true) {
      var jsonData = {"": ""};
      response = await ResponseClass.postApi(
          "https://arogyamitra.sewabhartigujarat.org/api/village-list",
          jsonData);
      print("Village -- ${response.body}");
    }
    return response!.body;
  }

  getNetworkConnectivityCheck() {
    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) {
      _source = source;
      print('$isNetworkConnected source $_source');
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          isNetworkConnected = false;

          break;
        case ConnectivityResult.wifi:
          isNetworkConnected = false;

          break;
        case ConnectivityResult.none:
        default:
          isNetworkConnected = true;
      }
      setState(() {});
    });
  }
}

class ResponseClass {
  static Future<http.Response> getApi(String api) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var url = Uri.parse(api);
    var response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${sharedPreferences.getString('token')}'
    });
    return response;
  }

  static Future<http.Response> postApi(
      String api, Map<String, dynamic> data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    http.Response response;
    var url = Uri.parse(api);

    final jsonString = json.encode(data);
    response = await http.post(url, body: jsonString, headers: {
      'Accept': 'application/json',
      'content-type': 'application/json',
      'Authorization': 'Bearer ${sharedPreferences.getString('token')}',
    });

    return response;
  }
}
