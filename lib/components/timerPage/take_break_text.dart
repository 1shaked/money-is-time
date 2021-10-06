import 'package:flutter/material.dart';

class TakeBreakText extends StatelessWidget {
  const TakeBreakText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
        bottom: 25,
      ),
      child: Text(
        'take a break',
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
