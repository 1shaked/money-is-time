import 'package:flutter/material.dart';
import 'package:moneytime/services/services.dart';
import 'package:hive_flutter/adapters.dart';

class JobsManager with ChangeNotifier {
  List<JobService> _jobs = [];
  int _selectedIndex = 0;
  bool _isEdit = false;
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

  String get currentCurrency => theNewJob['currency'];
  bool get isEdit => _isEdit;
  set isEdit(bool v) {
    _isEdit = v;
    notifyListeners();
  }

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

  addNewJob() async {
    JobService newJobService = JobService.fromJson(theNewJob);
    Box box = await Hive.openBox<JobService>("JobService");
    box.add(newJobService);

    // newJobService.createJob();
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

  editInIndex() async {
    JobService newJobService = JobService.fromJson(theNewJob);
    Box box = await Hive.openBox<JobService>("JobService");
    var l = box.values.toList();
    box.putAt(selectedIndex, newJobService);
    print(l);

    // box.put(newJobService.name, newJobService);
    jobs[selectedIndex] = newJobService;
    selectedIndex = 0;
    isEdit = false;
    notifyListeners();
  }
}
