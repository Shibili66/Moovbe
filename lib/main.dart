import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider.dart';
import 'UI/Drivers.dart';
import 'UI/Intro.dart';


void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => BusProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        home:  intro(),
        routes: {
          '/drivers':(context) => Drivers()
        },
      )));
}