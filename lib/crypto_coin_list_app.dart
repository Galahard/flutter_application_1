import 'package:flutter/material.dart';
import 'package:flutter_application_1/router/router.dart';
import 'package:flutter_application_1/theme/theme.dart';

class CryptoCoinList extends StatelessWidget {
  const CryptoCoinList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyFirstFlutterApp',
      theme: darkTheme,
      routes: routes,
    );
  }
}