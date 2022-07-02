import 'package:flutter/material.dart';
import 'package:salt/home_page.dart';

class SaltApp extends StatelessWidget {
  const SaltApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
