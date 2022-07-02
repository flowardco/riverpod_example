import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salt/provider/main_provider.dart';
import 'package:salt/salt_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => MainProvider()),
      ],
      child: const SaltApp(),
    ),
  );
}
