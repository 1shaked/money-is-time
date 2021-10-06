import 'package:flutter/material.dart';
import 'package:moneytime/services/services.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class TimerHeaderDetails extends StatelessWidget {
  const TimerHeaderDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    String dayName = DateFormat('EEEE').format(now);
    String formatter = DateFormat('yMd').format(now);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
      child: SizedBox(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$formatter - $dayName',
              style: Theme.of(context).textTheme.subtitle2, //subtitle2,
            ),
            Text(
              Provider.of<JobsManager>(context).currentJob.name,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
