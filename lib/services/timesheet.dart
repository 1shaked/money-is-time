import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moneytime/services/services.dart';

class Timesheet with ChangeNotifier {
  Map<int, JobsManager> _timesheet = {};
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  List<int> _selectedKeys = [];
  Timesheet() {
    initTimesheet();
    initSelectedJob();
  }

  initTimesheet() async {
    Box box = await Hive.openBox<JobsManager>(jobTime);
    timesheet = box.toMap().cast<int, JobsManager>();
  }

  initSelectedJob() async {
    Box boxJobsService = await Hive.openBox<JobService>(jobServiceKey);
    List<JobService> jobs = boxJobsService.values.toList().cast<JobService>();
    // JobsManagerint selectedIndex = await StorageManager.readData(selectedJobKey) ?? 0;
  }

  keyPressHandler(int key) {
    int index = selectedKeys.indexOf(key);
    if (index == -1) {
      selectedKeys.add(key);
    } else {
      selectedKeys.removeAt(index);
    }
    notifyListeners();
  }

  Map<int, JobsManager> get timesheetForSelectedJob {
    // return timesheet;
    Map<int, JobsManager> filteredMap;
    filteredMap = Map.from(timesheet)
      ..removeWhere((k, v) => !selectedKeys.contains(v.selectedKey));
    return filteredMap;
    // .where((element) => element.currentJob.name == selectedJob.name)
    //.toList();
  }

  List<int> get keysTimesheet => timesheetForSelectedJob.keys.toList();
  List<int> get selectedKeys => _selectedKeys;
  Map<int, JobsManager> get timesheet => _timesheet;
  set timesheet(Map<int, JobsManager> v) {
    _timesheet = v;
    notifyListeners();
  }

  DateTime get startDate => _startDate;
  set startDate(DateTime v) {
    _startDate = v;
    notifyListeners();
  }

  DateTime get endDate => _endDate;
  set endDate(DateTime v) {
    _endDate = v;
    notifyListeners();
  }

  set selectedKeys(List<int> v) {
    _selectedKeys = v;
    notifyListeners();
  }
}
