import 'package:flutter/material.dart';

class TopSelectionRow extends StatelessWidget {
  const TopSelectionRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double height = 34;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).secondaryHeaderColor,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                'Today',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            height: 34,
            decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                'Week',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            height: 34,
            width: 70,
            decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                'Month',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Text(
            'Job name',
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ],
    );
  }
}
