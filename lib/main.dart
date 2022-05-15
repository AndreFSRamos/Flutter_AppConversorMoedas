import 'package:conversor_moeda/pages/home.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.amber,
      )));
}
