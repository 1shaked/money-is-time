import 'package:flutter/material.dart';
import 'package:moneytime/services/services.dart';
import 'package:provider/provider.dart';

class MoneyEraned extends StatelessWidget {
  const MoneyEraned({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: Text(
        Provider.of<JobsManager>(context).moneyEarned.toStringAsFixed(3),
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 29,
        ),
      ),
    );
  }
}
