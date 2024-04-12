import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    //primaryColor: Color.fromARGB(255, 54, 186, 59),
    // colorScheme: ThemeData().colorScheme.copyWith(
    //       primary: const Color.fromARGB(255, 0, 70, 126),
    //       onPrimary: const Color.fromARGB(
    //           255, 45, 195, 97),
    //       secondary: const Color.fromARGB(255, 102, 117, 237),
    //       onSecondary: const Color.fromARGB(
    //           255, 200, 207, 24),
    //     ),
    // textTheme: ThemeData().textTheme.apply(
    //       bodyColor: const Color.fromARGB(255, 33, 123, 196),
    //       displayColor: const Color.fromARGB(255, 33, 123, 196),
    //     ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 0, 70, 126),
        foregroundColor: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 0, 70, 126)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    appBarTheme: contactAppBarTheme(),
  );
}

AppBarTheme contactAppBarTheme() {
  return const AppBarTheme(
    color: Color.fromARGB(255, 0, 70, 126),
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  );
}
