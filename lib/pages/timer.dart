import 'package:flutter/material.dart';
import 'package:moneytime/components/components.dart';
import 'package:moneytime/components/timerPage/timerPage.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          TimerHeaderDetails(),
          Timer(),
          DetailsCurrentWorkRow(),
          TakeBreakText(),
          ActionButtonTimer(),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(
        path: '/timesheet_page',
      ),
    );
  }
}
