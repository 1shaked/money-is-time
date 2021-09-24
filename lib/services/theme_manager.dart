import 'package:flutter/material.dart';
import 'package:moneytime/services/services.dart';

class ThemeNotifier with ChangeNotifier {
  final String themeModeString = 'themeMode';
  final String light = 'light';
  final String dark = 'dark';
  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFF212121),
    dividerColor: const Color.fromRGBO(221, 214, 252, 1),
    bottomAppBarColor:
        const Color.fromRGBO(188, 173, 248, 1), // the bottom app bar text color
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        // for the general text in the app
        color: Colors.black,
        fontSize: 18,
      ),
      bodyText2: TextStyle(
        // for the general text in the app
        color: Colors.white,
        fontSize: 18,
      ),
      button: TextStyle(color: Color.fromRGBO(188, 173, 248, 1)),
      headline1: TextStyle(
        // main headline like the settings headline
        color: Color.fromRGBO(196, 196, 196, 1),
        fontSize: 36,
      ),
      subtitle1: TextStyle(
        color: Color.fromRGBO(196, 196, 196, 1),
        fontSize: 16,
      ),
    ),
  );

  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFFE5E5E5),
    dividerColor: Colors.white54,
  );

  ThemeData _themeData = ThemeData(
    brightness: Brightness.dark,
  );
  ThemeData getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData(themeModeString).then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? light;
      if (themeMode == light) {
        _themeData = lightTheme;
      } else {
        print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData(themeModeString, dark);
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData(themeModeString, light);
    notifyListeners();
  }

  void toggleMode() async {
    if (_themeData == lightTheme) {
      _themeData = darkTheme;
      StorageManager.saveData(themeModeString, dark);
    } else {
      _themeData = lightTheme;
      StorageManager.saveData(themeModeString, light);
    }
    notifyListeners();
  }
}
