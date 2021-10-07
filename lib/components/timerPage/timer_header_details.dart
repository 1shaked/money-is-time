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
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                '$formatter - $dayName',
                style: Theme.of(context).textTheme.subtitle2, //subtitle2,
              ),
            ),
            DropdownButton(
              value: Provider.of<JobsManager>(context).currentJob,
              items:
                  Provider.of<JobsManager>(context).jobs.map((JobService item) {
                return DropdownMenuItem<JobService>(
                  child: Text(
                    item.name,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  value: item,
                );
              }).toList(),
              onChanged: (JobService? v) {
                int index = Provider.of<JobsManager>(context, listen: false)
                    .jobs
                    .indexOf(v ?? JobService());
                if (index > -1) {
                  Provider.of<JobsManager>(context, listen: false)
                      .selectedIndex = index;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
