// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:demoapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([http.Client])
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  group('getNumberTrivia', () {
    test('login response is successful', () async {
      var response = await MyApp().createState().getLogin();
      var status = jsonDecode(response.toString())['status'];
      expect(status, "1");
    });

    test('village response is successful', () async {
      var response = await MyApp().createState().getVillage();
      var status = jsonDecode(response.toString())['status'];
      expect(status, "1");
    });
  });
}
