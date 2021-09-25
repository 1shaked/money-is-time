import 'package:flutter/material.dart';

class ActionButtonTimer extends StatelessWidget {
  const ActionButtonTimer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 202,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Color.fromRGBO(121, 210, 141, 1),
      ),
      child: Center(
        child: Text(
          'start',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
