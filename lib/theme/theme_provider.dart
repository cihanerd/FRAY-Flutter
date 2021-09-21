import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blue, brightness: Brightness.dark),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 30, 30, 45),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 30, 30, 45),
    ),
  );

  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.indigo, brightness: Brightness.light),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Color.fromARGB(255, 30, 30, 45),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 30, 30, 45),
    ),
  );
}
