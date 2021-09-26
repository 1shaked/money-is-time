import 'package:flutter/material.dart';
import 'package:moneytime/components/components.dart';
import 'package:moneytime/components/timerPage/timerPage.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Provider.of<ThemeNotifier>(context).backgroundColorScaffold,
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
        path: '/timer_page',
      ),
    );
  }
}
