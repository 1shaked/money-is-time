import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopHeaderJob extends StatelessWidget {
  const TopHeaderJob({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Edit',
          style: Theme.of(context).textTheme.button,
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.plus),
          onPressed: () {
            print("Pressed");
            Navigator.pushNamed(context, '/create_job_page');
          },
        ),
      ],
    );
  }
}
