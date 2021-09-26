import 'package:flutter/material.dart';

class Timer extends StatelessWidget {
  const Timer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '00:00:00',
        style: TextStyle(
          fontSize: 55,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
