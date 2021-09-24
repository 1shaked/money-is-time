import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:moneytime/pages/pages.dart';
import 'package:moneytime/pages/settings.dart';
import 'package:moneytime/pages/timesheet.dart';
import 'package:moneytime/services/theme_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    // themeNotifier.setDarkMode(); // TODO: delete it and add it to the button
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeNotifier()),
        ],
        builder: (context, child) {
          return Consumer<ThemeNotifier>(
            builder: (context, themeNotifier, __) => MaterialApp(
              title: 'Flutter Demo',
              navigatorObservers: [
                FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
              ],
              theme: Provider.of<ThemeNotifier>(context)
                  .getTheme(), // ThemeData(brightness: Brightness.dark,), // Provider.of<ThemeNotifier>(context).getTheme(),
              routes: {
                '/home_page': (context) => const HomePage(),
                '/analytics_page': (context) => const AnalyticsPage(),
                '/jobs_page': (context) => const JobsPage(),
                '/timer_page': (context) => const TimerPage(),
                '/settings_page': (context) => const SettingsPage(),
              },
              home:
                  const HomePage(), // const MyHomePage(title: 'Flutter Demo Home Page'),
            ),
          );
        });
  }
}
