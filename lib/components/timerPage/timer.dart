import 'package:flutter/material.dart';
import 'package:moneytime/services/services.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class Timer extends StatefulWidget {
  const Timer({
    Key? key,
  }) : super(key: key);

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    // Timer.periodic(1, (Timer t) => setState(() {}));
    return Center(
      child: Text(
        Provider.of<JobsManager>(context).formatTime,
        style: TextStyle(
          fontSize: 55,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
