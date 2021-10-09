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
    print(Provider.of<JobsManager>(context).jobs);
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
              value: Provider.of<JobsManager>(context).selectedKey,
              items: Provider.of<JobsManager>(context)
                  .jobs
                  .entries
                  .map((MapEntry item) {
                return DropdownMenuItem<int>(
                  child: Text(
                    item.value.name,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  value: item.key,
                );
              }).toList(),
              onChanged: (int? v) {
                if (v != null) {
                  Provider.of<JobsManager>(context, listen: false).selectedKey =
                      v;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
