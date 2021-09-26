import 'package:flutter/material.dart';
import 'package:moneytime/components/components.dart';
import 'package:moneytime/components/timesheet/timesheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            TopSelectionRow(),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  LimitedBox(
                    maxHeight: 70.0,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Color.fromRGBO(233, 230, 254, 1)
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
                                children: [
                                  Text(
                                    '50₪',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  Text(
                                    '9:15-11:23',
                                    style: TextStyle(
                                      fontSize: 18,
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
                              'Sun 04.05.2021',
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Color.fromRGBO(165, 155, 250, 1)
                                    : Color.fromRGBO(137, 44, 220, 1),
                              ),
                            ),
                          ),
                          Center(
                            child: IconButton(
                                // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                icon: FaIcon(
                                  FontAwesomeIcons.chevronRight,
                                ),
                                onPressed: () {
                                  print("Pressed");
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
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
