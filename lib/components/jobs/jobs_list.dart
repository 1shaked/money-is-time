import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JobsList extends StatelessWidget {
  const JobsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    color: Theme.of(context).brightness == Brightness.light
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
                      child: Text(
                        'job1',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
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
    );
  }
}
