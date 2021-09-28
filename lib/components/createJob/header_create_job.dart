import 'package:flutter/material.dart';

class HeaderCreateJob extends StatelessWidget {
  const HeaderCreateJob({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, top: 80),
      decoration: BoxDecoration(
        color: Theme.of(context).toggleableActiveColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Flexible(
              flex: 1,
              child: Text(
                '< Jobs',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Text(
              'Add New Job',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              'Save',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
