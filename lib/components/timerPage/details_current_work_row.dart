import 'package:flutter/material.dart';

class DetailsCurrentWorkRow extends StatelessWidget {
  const DetailsCurrentWorkRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '0M',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('break',
                        style: Theme.of(context).textTheme.subtitle1),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '0M',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Earend',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                  width: 5,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '0M',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Overtime',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
