import 'package:flutter/material.dart';
import 'package:moneytime/services/services.dart';
import 'package:provider/provider.dart';

class ActionButtonTimer extends StatelessWidget {
  const ActionButtonTimer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Provider.of<JobsManager>(context, listen: false).actionButtonClick();
        // Provider.of<Timesheet>(context, listen: false).initTimesheet();
      },
      child: Container(
        width: 202,
        height: 68,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Provider.of<JobsManager>(context).isActive
              ? Colors.redAccent
              : Colors.blueAccent,
        ),
        child: Center(
          child: Text(
            Provider.of<JobsManager>(context).isActive ? 'Stop' : 'Start',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}
