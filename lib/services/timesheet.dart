import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moneytime/services/services.dart';

class Timesheet with ChangeNotifier {
  List<JobsManager> _timesheet = [];
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  late JobService _selectedJob = JobService();
  Timesheet() {
    initTimesheet();
    initSelectedJob();
  }

  initTimesheet() async {
    Box box = await Hive.openBox<JobsManager>(jobTime);
    timesheet = box.values
        //.where((element) => element.currentJob.name == 'aaa')
        .toList()
        .cast();

    print(timesheet);
  }

  initSelectedJob() async {
    Box boxJobsService = await Hive.openBox<JobService>(jobServiceKey);
    List<JobService> jobs = boxJobsService.values.toList().cast<JobService>();
    int selectedIndex = await StorageManager.readData(selectedJobKey) ?? 0;
    selectedJob = jobs[selectedIndex];
  }

  List<JobsManager> get timesheetForSelectedJob {
    return timesheet;
    // .where((element) => element.currentJob.name == selectedJob.name)
    //.toList();
  }

  List<JobsManager> get timesheet => _timesheet;
  set timesheet(List<JobsManager> v) {
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

  JobService get selectedJob => _selectedJob;
  set selectedJob(JobService v) {
    _selectedJob = v;
    notifyListeners();
  }
}
