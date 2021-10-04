import 'package:flutter/material.dart';
import 'package:moneytime/services/services.dart';

ThemeData baseThem = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  toggleableActiveColor: const Color.fromRGBO(165, 155, 250, 1),
  secondaryHeaderColor: const Color.fromRGBO(188, 173, 248, 1),
  primaryColor: Colors.black,
  brightness: Brightness.light,
  backgroundColor: Colors.white, //const Color(0xFF212121),
  dividerColor: const Color.fromRGBO(221, 214, 252, 1),
  bottomAppBarColor:
      const Color.fromRGBO(188, 173, 248, 1), // the bottom app bar text color
  textTheme: const TextTheme(
    headline2: TextStyle(
      color: Color.fromRGBO(188, 173, 248, 1),
      fontSize: 14,
    ),
    headline3: TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
    bodyText1: TextStyle(
      // for the general text in the app
      color: Colors.black,
      fontSize: 18,
    ),
    bodyText2: TextStyle(
      // for the general text in the app
      color: Color.fromRGBO(196, 196, 196, 1),
      fontSize: 18,
    ),
    button: TextStyle(
      color: Color.fromRGBO(188, 173, 248, 1),
      fontSize: 14,
    ),
    headline1: TextStyle(
      // main headline like the settings headline
      color: Colors.black,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
    subtitle1: TextStyle(
      color: Color.fromRGBO(196, 196, 196, 1),
      fontSize: 16,
    ),
    subtitle2: TextStyle(
      color: Color.fromRGBO(188, 173, 248, 1),
      fontSize: 16,
    ),
  ),
);

class ThemeNotifier with ChangeNotifier {
  final String themeModeString = 'themeMode';
  final String light = 'light';
  final String dark = 'dark';
  ThemeData lightTheme = baseThem;

  final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    toggleableActiveColor: const Color.fromRGBO(137, 44, 220, 1),
    secondaryHeaderColor: const Color.fromRGBO(
        188, 111, 241, 1), // color inside and surround most widget
    primaryColor: Colors.white, // text color
    brightness: Brightness.dark,
    primaryColorDark: Colors.black,
    backgroundColor: Colors.black, //const Color(0xFF212121),
    dividerColor: Colors.white,
    bottomAppBarColor:
        const Color.fromRGBO(137, 44, 220, 1), // the bottom app bar text color
    textTheme: const TextTheme(
      headline2: TextStyle(
        color: Color.fromRGBO(188, 111, 241, 1),
        fontSize: 14,
      ),
      headline3: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      bodyText1: TextStyle(
        // for the general text in the app
        color: Colors.white,
        fontSize: 18,
      ),
      bodyText2: TextStyle(
        // for the Take a break text similar to subtitle
        color: Color.fromRGBO(196, 196, 196, 1),
        fontSize: 18,
      ),
      button: TextStyle(
        // for mist button
        color: Color.fromRGBO(188, 111, 241, 1),
        fontSize: 14,
      ),
      headline1: TextStyle(
        // general title like
        // main headline like the settings headline
        color: Colors.white,
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        color: Color.fromRGBO(196, 196, 196, 1),
        fontSize: 16,
      ),
      subtitle2: TextStyle(
        color: Color.fromRGBO(188, 111, 241, 1),
        fontSize: 16,
      ),
    ),
  );

  TextStyle inputStyle = TextStyle(
    fontSize: 18,
    color: Color.fromRGBO(0, 0, 0, 0.4),
  );
  bool get isDark => _themeData.brightness == Brightness.dark;

  Color get backgroundColorScaffold {
    if (isDark) return Colors.black;
    return Colors.white;
  }

  ThemeData _themeData = baseThem;
  ThemeData getTheme() => _themeData;
  ThemeNotifier() {
    StorageManager.readData(themeModeString).then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = light; // var themeMode = value ?? light
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
