import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BusProvider extends ChangeNotifier {
  final String baseUrl = "http://flutter.noviindus.co.in/api/";
  List _drivers = [];
  List get drivers => _drivers;

  Future<void> login(String username, String pass) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      var res = await http.post(
        Uri.parse("$baseUrl/LoginApi"),
        body: jsonEncode({"username": username, "password": pass}),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
      );

      var decoded = jsonDecode(res.body);

      await prefs.setString("token", decoded["access"]);
      await prefs.setString("url", decoded["url_id"]);
      print(decoded["access"]);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> driversGet() async {
    final prefs = await SharedPreferences.getInstance();
    var url = await prefs.getString('url');
    print(url);

    var token = await prefs.getString('token');
    print(token);
    print("$baseUrl/DriverApi/$url/");
    try {
      var res = await http.get(
        Uri.parse("$baseUrl/DriverApi/$url/"),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      var decoded = jsonDecode(res.body);

      _drivers = decoded["driver_list"].toList();
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
