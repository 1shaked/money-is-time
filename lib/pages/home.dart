import 'package:flutter/material.dart';
import 'package:moneytime/components/components.dart';
import 'package:path/path.dart' as p;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home 2 Page ${p.current}',
          style: const TextStyle(
            fontSize: 55,
            color: Colors.blueAccent,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(path: '/home_page'),
    );
  }
}
