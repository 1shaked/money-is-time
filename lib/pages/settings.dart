import 'package:flutter/material.dart';
import 'package:moneytime/components/components.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'Settings Page',
          style: TextStyle(
            fontSize: 55,
            color: Colors.blueAccent,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        path: '/settings_page',
      ),
    );
  }
}
