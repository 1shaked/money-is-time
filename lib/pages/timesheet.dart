import 'package:flutter/material.dart';
import 'package:moneytime/components/components.dart';

class TimesheetPage extends StatelessWidget {
  const TimesheetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('time sheep page'),
      ),
      bottomNavigationBar: const BottomNavigation(
        path: '/timer_page',
      ),
    );
  }
}
