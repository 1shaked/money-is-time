import 'package:flutter/material.dart';
import 'package:moneytime/services/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'dart:async';

const String selectedJobKey = 'job_index';
const String jobServiceKey = 'JobService';

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
  DateTime _startTime = DateTime.now();
  DateTime _endTime = DateTime.now();
  bool _isActive = false;
  Stopwatch stopwatch = Stopwatch();
  set theNewJob(Map<String, dynamic> newJob) {
    _theNewJob = newJob;
    notifyListeners();
  }

  JobsManager() {
    initAllJobs();
  }
  initAllJobs() async {
    Box box = await Hive.openBox<JobService>(jobServiceKey);
    jobs = box.values.toList().cast<JobService>();
    selectedIndex = await StorageManager.readData(selectedJobKey) ?? 0;
  }

  Duration get workTime => endTime.difference(startTime);
  String get formatTime => '${stopwatch.elapsedMilliseconds}';
  Map<String, dynamic> get theNewJob => _theNewJob;
  bool get isActive => _isActive;
  DateTime get startTime => _startTime;
  DateTime get endTime => _endTime;
  String get currentCurrency => theNewJob['currency'];
  bool get isEdit => _isEdit;
  set isEdit(bool v) {
    _isEdit = v;
    notifyListeners();
  }

  set isActive(bool v) {
    _isActive = v;
    notifyListeners();
  }

  set startTime(DateTime v) {
    _startTime = v;
    notifyListeners();
  }

  set endTime(DateTime v) {
    _endTime = v;
    notifyListeners();
  }

  void setKey(String key, dynamic value) {
    _theNewJob[key] = value;
    notifyListeners();
  }

  void actionButtonClick() {
    if (isActive) {
      endTime = DateTime.now();
      stopwatch.stop();
      print(stopwatch.elapsedMilliseconds);
    } else {
      startTime = DateTime.now();
      stopwatch.start();
      // Timer.periodic(new Duration(seconds: 1), (timer) { debugPrint(timer.tick.toString()); });
    }
    isActive = !isActive;
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
    Box box = await Hive.openBox<JobService>(jobServiceKey);
    box.add(newJobService);
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
    Box box = await Hive.openBox<JobService>(jobServiceKey);
    jobs = box.values.toList().cast<JobService>();
  }

  set jobs(List<JobService> jobs) {
    _jobs = jobs;
    notifyListeners();
  }

  set selectedIndex(int index) {
    _selectedIndex = index;
    StorageManager.saveData(selectedJobKey, index);
    notifyListeners();
  }

  editInIndex() async {
    JobService newJobService = JobService.fromJson(theNewJob);
    Box box = await Hive.openBox<JobService>(jobServiceKey);
    box.putAt(selectedIndex, newJobService);
    jobs[selectedIndex] = newJobService;
    selectedIndex = 0;
    isEdit = false;
    notifyListeners();
  }
}
