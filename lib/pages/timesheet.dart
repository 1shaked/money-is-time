import 'package:flutter/material.dart';
import 'package:moneytime/components/components.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'timer Page',
          style: TextStyle(
            fontSize: 55,
            color: Colors.blueAccent,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        path: '/timer_page',
      ),
    );
  }
}
