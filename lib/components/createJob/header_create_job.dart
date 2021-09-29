import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneytime/services/services.dart';
import 'package:provider/provider.dart';

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
            child: Text(
              '< Jobs',
              style: Theme.of(context).textTheme.bodyText1,
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
            child: GestureDetector(
              onTap: () {
                if (Provider.of<JobService>(context, listen: false).isValid) {
                  print('Provider.of<JobService>(context, listen: false)');
                  return;
                }
                showCupertinoDialog<void>(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                    title: const Text('Input Error'),
                    content: const Text(
                        'There is a problme with either the Job name (empty) or Currency'),
                    actions: <CupertinoDialogAction>[
                      CupertinoDialogAction(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
              child: Text(
                'Save',
                style: Provider.of<JobService>(context).isValid
                    ? Theme.of(context).textTheme.bodyText1
                    : Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
