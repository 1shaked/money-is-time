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
              Provider.of<JobsManager>(context, listen: false).isEdit = false;
              Navigator.pop(context);
            },
            child: Text(
              '< Jobs',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          const Flexible(
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
                if (Provider.of<JobsManager>(context, listen: false).isValid) {
                  if (Provider.of<JobsManager>(context, listen: false).isEdit) {
                    Provider.of<JobsManager>(context, listen: false)
                        .editInIndex();
                  } else {
                    Provider.of<JobsManager>(context, listen: false)
                        .addNewJob();
                  }
                  Navigator.pop(context);
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
                style: Provider.of<JobsManager>(context).isValid
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
