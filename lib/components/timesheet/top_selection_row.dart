import 'package:flutter/material.dart';
import 'package:moneytime/services/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

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
          child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text('Select Jobs to see'),
                      content: Container(
                        width: 300,
                        height: 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              Provider.of<JobsManager>(context).jobList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                int key = Provider.of<JobsManager>(context,
                                            listen: false)
                                        .jobList[index]['k'] ??
                                    0;
                                Provider.of<Timesheet>(context, listen: false)
                                    .keyPressHandler(key);
                              },
                              child: Container(
                                height: 50,
                                color: Colors.amber[800],
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Provider.of<Timesheet>(context)
                                                    .selectedKeys
                                                    .indexOf(Provider.of<
                                                                JobsManager>(
                                                            context)
                                                        .jobList[index]['k']) !=
                                                -1
                                            ? Icons.check_circle
                                            : Icons.check_circle_outline,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        Provider.of<JobsManager>(context)
                                            .jobList[index]['v']
                                            ?.name,
                                        // Provider.of<Timesheet>(context).selectedKeys
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  });
            },
            child: Text(
              'select jobs',
            ),
          ),
        ),
      ],
    );
  }
}
