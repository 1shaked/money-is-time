import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:moneytime/pages/pages.dart';
import 'package:moneytime/pages/settings.dart';
import 'package:moneytime/services/services.dart';
import 'package:moneytime/services/theme_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(JobServiceAdapter());
  Hive.registerAdapter(JobsManagerAdapter());
  /*
  Box box = await Hive.openBox<JobService>("JobService");
  var boxs = box.values.toList();
  print(boxs);
  JobService jobService = JobService();
  jobService.name = 'test1';
  // box.put(jobService.name, jobService);
  // box.add(jobService);
  box.values.map((item) {
    print(item.toString());
    print('----------------------------');
    return item;
  }).toList();
  print(box.values.toList());
   */
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
          ChangeNotifierProvider(create: (context) => JobsManager()),
          ChangeNotifierProvider(create: (context) => Timesheet())
        ],
        builder: (context, child) {
          return Consumer<ThemeNotifier>(
            builder: (context, themeNotifier, __) => MaterialApp(
              navigatorObservers: [
                FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
              ],
              theme: Provider.of<ThemeNotifier>(context)
                  .getTheme(), // ThemeData(brightness: Brightness.dark,), // Provider.of<ThemeNotifier>(context).getTheme(),
              routes: {
                '/home_page': (context) => const HomePage(),
                '/analytics_page': (context) => const AnalyticsPage(),
                '/jobs_page': (context) => const JobsPage(),
                '/timesheet_page': (context) => const TimesheetPage(),
                '/timer_page': (context) => const TimerPage(),
                '/settings_page': (context) => const SettingsPage(),
                '/create_job_page': (context) => const CreateJobPage(),
              },
              home:
                  const HomePage(), // const MyHomePage(title: 'Flutter Demo Home Page'),
            ),
          );
        });
  }
}
