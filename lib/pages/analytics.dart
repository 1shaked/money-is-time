import 'package:flutter/material.dart';
import 'package:moneytime/components/components.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Analytics Page',
          style: TextStyle(
            fontSize: 55,
            color: Colors.blueAccent,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        path: '/analytics_page',
      ),
    );
  }
}
