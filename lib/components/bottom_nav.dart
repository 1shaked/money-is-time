import 'package:flutter/material.dart';

class Routes {
  BuildContext context;
  String path;
  Routes(this.context, this.path);
  List<Map<String, String>> routes = [
    {
      'label': 'Timer',
      'route': '/timer_page',
    },
    {
      'label': 'Analytics',
      'route': '/analytics_page',
    },
    {
      'label': 'Jobs',
      'route': '/jobs_page',
    },
    {
      'label': 'Settings',
      'route': '/settings_page',
    },
  ];
  Map<String, IconData> icons = {
    '/timer_page': Icons.access_time,
    '/analytics_page': Icons.bar_chart,
    '/jobs_page': Icons.business_center,
    '/settings_page': Icons.settings
  };
  int get currentIndex {
    return path == '/home_page'
        ? 0
        : routes.indexWhere((element) => element['route'] == path);
  }

  List<BottomNavigationBarItem> get navigationItems {
    return routes.map((route) {
      return BottomNavigationBarItem(
        label: route['label'],
        icon: Icon(
          icons[route['route']],
          color: route['route'] == path
              ? Theme.of(context).bottomAppBarColor
              : const Color.fromRGBO(196, 196, 196, 1),
        ),
      );
    }).toList();
  }
}

class BottomNavigation extends StatelessWidget {
  final String path;

  // String path;
  const BottomNavigation({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Routes routes = Routes(context, path);
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: BottomNavigationBar(
        items: routes.navigationItems,
        showUnselectedLabels: true,
        unselectedFontSize: 14,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).backgroundColor, // Colors.white,
        selectedItemColor: Theme.of(context).bottomAppBarColor,
        // backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        currentIndex: routes.currentIndex,
        onTap: (idx) {
          Routes route = Routes(context, path);
          Navigator.of(context).pushNamedAndRemoveUntil(
              route.routes[idx]['route'] ?? '/', (route) => false);
        },
      ),
    );
  }
}
