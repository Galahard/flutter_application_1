import 'package:flutter/material.dart';

final darkTheme= ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 64, 61, 61),
        // bottomAppBarTheme: const BottomAppBarTheme(
        //       color: Color.fromARGB(255, 40, 36, 36),
        // ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
            backgroundColor: Color.fromARGB(255, 40, 36, 36),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700)),
        primaryColor: Colors.yellow,
        dividerColor: Colors.white24,
        listTileTheme: const ListTileThemeData(iconColor: Colors.white24),
        textTheme: TextTheme(
            bodyMedium: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
            labelSmall: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w700,
              fontSize: 14,
            )),
      );