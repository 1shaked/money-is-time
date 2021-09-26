import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:moneytime/components/components.dart';
import 'package:moneytime/components/settings/settings.dart';
import 'package:moneytime/services/services.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // const width = 338;
    const EdgeInsetsGeometry margin = EdgeInsets.only(
      top: 20,
      left: 20,
      right: 20,
    );
    const EdgeInsetsGeometry padding = EdgeInsets.only(
      left: 20,
    );
    final BorderRadiusGeometry boxRadius = BorderRadius.circular(6);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 25,
          right: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: Theme.of(context).textTheme.headline1,
            ),
            SettingsButton(
              margin: margin,
              padding: padding,
              boxRadius: boxRadius,
              buttonStatus: true,
              buttonText: 'Export entries',
              hasSwitch: false,
              tapping: (v) {
                print('tapping');
                print(v);
              },
            ),
            SettingsButton(
              margin: margin,
              padding: padding,
              boxRadius: boxRadius,
              buttonStatus: true,
              buttonText: 'Add Custom Settings Week',
              hasSwitch: false,
              tapping: (v) => {},
            ),
            SettingsButton(
              margin: margin,
              padding: padding,
              boxRadius: boxRadius,
              buttonStatus: true,
              buttonText: 'Add Custom Month',
              hasSwitch: false,
              tapping: (v) => {},
            ),
            SettingsButton(
              margin: margin,
              padding: padding,
              boxRadius: boxRadius,
              buttonStatus: true,
              buttonText: 'Clock out Reminders',
              hasSwitch: true,
              tapping: (v) => {},
            ),
            SettingsButton(
              margin: margin,
              padding: padding,
              boxRadius: boxRadius,
              buttonStatus: Provider.of<ThemeNotifier>(context).isDark,
              buttonText: 'Dark Mode',
              hasSwitch: true,
              tapping: (v) => {
                Provider.of<ThemeNotifier>(context, listen: false).toggleMode()
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        path: '/settings_page',
      ),
    );
  }
}
