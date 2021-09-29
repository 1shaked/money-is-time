import 'package:flutter/material.dart';
import 'package:moneytime/services/services.dart';
import 'package:hive_flutter/adapters.dart';

class JobsManager with ChangeNotifier {
  List<JobService> _jobs = [];
  int _selectedIndex = 0;
  Map<String, dynamic> _theNewJob = {
    'name': 'New Job',
    'rate': 100,
    'currency': '₪',
    'paidBreaks': false,
    'presentBreaks': false,
    'location': 'Tel Aviv center'
  };
  Map<String, dynamic> get theNewJob => _theNewJob;
  set theNewJob(Map<String, dynamic> newJob) {
    _theNewJob = newJob;
    notifyListeners();
  }

  JobsManager() {
    initAllJobs();
  }
  initAllJobs() async {
    Box box = await Hive.openBox<JobService>("JobService");
    jobs = box.values.toList().cast<JobService>();
  }

  String get currentCurrency => _theNewJob['currency'];

  void setKey(String key, dynamic value) {
    _theNewJob[key] = value;
    notifyListeners();
  }

  List<JobService> get jobs => _jobs;
  int get selectedIndex => _selectedIndex;

  JobService get currentJob {
    if (_jobs.isNotEmpty) return _jobs[_selectedIndex];
    return JobService();
  }

  bool get isValid =>
      theNewJob['name'].isNotEmpty && theNewJob['currency'].length == 1;

  addNewJob() {
    JobService newJobService = JobService.fromJson(theNewJob);
    newJobService.createJob();
    jobs.add(newJobService);
    theNewJob = {
      'name': 'New Job',
      'rate': 100,
      'currency': '₪',
      'paidBreaks': false,
      'presentBreaks': false,
      'location': 'Tel Aviv center'
    }; // to make all parameter empty
  }

  getJobs() async {
    Box box = await Hive.openBox<JobService>("JobService");
    jobs = box.values.toList().cast<JobService>();
  }

  set jobs(List<JobService> jobs) {
    _jobs = jobs;
    notifyListeners();
  }

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
