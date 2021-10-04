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
      onTap: () {
        Provider.of<JobsManager>(context, listen: false).actionButtonClick();
      },
      child: Container(
        width: 202,
        height: 68,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Provider.of<JobsManager>(context).isActive
              ? Colors.redAccent
              : const Color.fromRGBO(121, 210, 141, 1),
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
