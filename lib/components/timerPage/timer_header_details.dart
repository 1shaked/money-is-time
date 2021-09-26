import 'package:flutter/material.dart';

class TimerHeaderDetails extends StatelessWidget {
  const TimerHeaderDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
      child: SizedBox(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Week of 12-18.03.2021',
              style: Theme.of(context).textTheme.subtitle2, //subtitle2,
            ),
            Text(
              'Job1',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
