import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moneytime/services/services.dart';

class Timesheet with ChangeNotifier {
  List<JobsManager> _timesheet = [];

  Timesheet() {
    initTimesheet();
  }

  initTimesheet() async {
    Box box =
        await Hive.openBox<JobsManager>(jobTime); // TODO: only for testing
    timesheet = box.values
        //.where((element) => element.currentJob.name == 'aaa')
        .toList()
        .cast();
    print(timesheet);
  }

  List<JobsManager> get timesheet => _timesheet;
  set timesheet(List<JobsManager> v) {
    _timesheet = v;
    notifyListeners();
  }
}
