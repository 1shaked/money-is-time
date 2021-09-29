import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moneytime/components/components.dart';
import 'package:moneytime/components/jobs/jobs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneytime/services/services.dart';
import 'package:provider/provider.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 50,
          left: 25,
          right: 25,
        ),
        child: Column(
          children: [
            TopHeaderJob(),
            JobsList(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(
        path: '/jobs_page',
      ),
    );
  }
}
