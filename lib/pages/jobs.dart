import 'package:flutter/material.dart';
import 'package:moneytime/components/components.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'Jobs Page Page',
          style: TextStyle(
            fontSize: 55,
            color: Colors.blueAccent,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        path: '/jobs_page',
      ),
    );
  }
}
