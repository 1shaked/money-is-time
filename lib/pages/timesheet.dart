import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneytime/components/components.dart';
import 'package:moneytime/components/timesheet/timesheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneytime/services/services.dart';
import 'package:provider/provider.dart';

class TimesheetPage extends StatelessWidget {
  const TimesheetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 25,
          right: 25,
        ),
        child: Column(
          children: [
            const TopSelectionRow(),
            Container(
              height: 600,
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ListView.builder(
                itemCount: Provider.of<Timesheet>(context).keysTimesheet.length,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  int key =
                      Provider.of<Timesheet>(context).keysTimesheet[index];
                  return LimitedBox(
                    maxHeight: 70.0,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? const Color.fromRGBO(233, 230, 254, 1)
                                    : Colors.white,
                            width: 3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0),
                                    child: Text(
                                      '${Provider.of<Timesheet>(context).timesheetForSelectedJob[key]?.moneyEarned.toStringAsFixed(2)} ${Provider.of<Timesheet>(context).timesheetForSelectedJob[key]?.currentJob.name}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${DateFormat('h:mm a').format(Provider.of<Timesheet>(context).timesheetForSelectedJob[key]?.startTime ?? DateTime.now())} - ${DateFormat('h:mm a').format(Provider.of<Timesheet>(context).timesheetForSelectedJob[key]?.endTime ?? DateTime.now())}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              DateFormat('d MMM').format(
                                  Provider.of<Timesheet>(context)
                                          .timesheetForSelectedJob[key]
                                          ?.startTime ??
                                      DateTime.now()),
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? const Color.fromRGBO(165, 155, 250, 1)
                                    : const Color.fromRGBO(137, 44, 220, 1),
                              ),
                            ),
                          ),
                          Center(
                            child: IconButton(
                                // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                icon: const FaIcon(
                                  FontAwesomeIcons.chevronRight,
                                ),
                                onPressed: () {
                                  print("Pressed");
                                }),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(
        path: '/timesheet_page',
      ),
    );
  }
}
