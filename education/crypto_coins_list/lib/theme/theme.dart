import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
  primarySwatch: Colors.yellow,
  dividerColor: Colors.white24,
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 0,
    backgroundColor: Color.fromARGB(255, 31, 31, 31),
    titleTextStyle: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
  ),
  textTheme: TextTheme(
      bodyMedium: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
      headlineMedium: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      ),
      bodyLarge: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      )
  )
);
