import 'package:flutter/material.dart';
import 'package:moneytime/services/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'dart:async';
import 'package:hive/hive.dart';
part 'jobs_manager.g.dart';

const String selectedJobKey = 'job_index';
const String jobServiceKey = 'JobService';
const String jobTime = 'JobTime';

@HiveType(typeId: 1)
class JobsManager extends HiveObject with ChangeNotifier {
  Map<int, JobService> _jobs = {};
  int _selectedKey = 0;
  bool _isEdit = false;
  Map<String, dynamic> _theNewJob = {
    'name': 'New Job',
    'rate': 100,
    'currency': '₪',
    'paidBreaks': false,
    'presentBreaks': false,
    'location': 'Tel Aviv center'
  };
  @HiveField(0)
  DateTime _startTime = DateTime.now();
  @HiveField(1)
  DateTime _endTime = DateTime.now();
  bool _isActive = false;
  Stopwatch stopwatch = Stopwatch();
  TimesEntry timesEntry = TimesEntry();
  JobsManager() {
    initAllJobs();
  }

  JobsManager.withParams(DateTime _startTime, DateTime _endTime,
      Stopwatch stopwatch, Map<int, JobService> _jobs, int _selectedKey) {
    startTime = _startTime;
    endTime = _endTime;
    stopwatch = Stopwatch();
    selectedKey = _selectedKey;
    jobs = _jobs;
    notifyListeners();
  }

  initAllJobs() async {
    Box box = await Hive.openBox<JobService>(jobServiceKey);
    jobs = box.toMap().cast<int, JobService>();
    selectedKey = await StorageManager.readData(selectedJobKey) ?? 0;
  }

  void setKey(String key, dynamic value) {
    _theNewJob[key] = value;
    notifyListeners();
  }

  void actionButtonClick() async {
    if (isActive) {
      endTime = DateTime.now();
      stopwatch.stop();
      // JobsManager
      Box box = await Hive.openBox<JobsManager>(jobTime);
      JobsManager jobsManager = JobsManager.withParams(startTime, endTime,
          stopwatch, {selectedKey: currentJob}, selectedKey);
      int key = await box.add(jobsManager);
      print(key);
      startTime = DateTime.now();
      endTime = DateTime.now();
      stopwatch.stop();
      stopwatch = Stopwatch();
    } else {
      startTime = DateTime.now();
      stopwatch.start();
      Timer.periodic(const Duration(seconds: 1), (timer) {
        notifyListeners();
      });
    }
    isActive = !isActive;
    notifyListeners();
  }

  addNewJob() async {
    JobService newJobService = JobService.fromJson(theNewJob);
    Box box = await Hive.openBox<JobService>(jobServiceKey);
    int key = await box.add(newJobService);
    jobs[key] = newJobService;
    theNewJob = {
      'name': 'New Job',
      'rate': 100,
      'currency': '₪',
      'paidBreaks': false,
      'presentBreaks': false,
      'location': 'Tel Aviv center'
    }; // to make all parameter empty
  }

  @override
  toString() {
    return 'start - $startTime end $endTime $currentJob';
  }

  Future<JobService> editInIndex() async {
    JobService newJobService = JobService.fromJson(theNewJob);
    Box box = await Hive.openBox<JobService>(jobServiceKey);
    box.putAt(selectedKey, newJobService);
    jobs[selectedKey] = newJobService;
    isEdit = false;
    notifyListeners();
    return newJobService;
  }

  // #region getters / setters
  @HiveField(2)
  JobService get currentJob => _jobs[selectedKey] ?? JobService();

  int get selectedKey => _selectedKey;
  Duration get workTime => endTime.difference(startTime);
  String get formatTime {
    Duration totalTime = Duration(milliseconds: stopwatch.elapsedMilliseconds);
    String s = totalTime.toString();
    if (s[1] == ':') {
      s = '0$s';
    }
    List<String> times = s.split('.');
    return times[0];
  }

  MapEntry<int, JobService> get entry {
    // jobs.entrie.; // TODO: delete this
    return MapEntry(5, JobService());
  }

  double get moneyEarned {
    Duration totalTime = stopwatch.elapsedMilliseconds != 0
        ? Duration(milliseconds: stopwatch.elapsedMilliseconds)
        : endTime.difference(startTime);
    return totalTime.inSeconds * currentJob.rate / 3600;
  }

  Map<String, dynamic> get theNewJob => _theNewJob;
  bool get isActive => _isActive;
  DateTime get startTime => _startTime;
  DateTime get endTime => _endTime;
  String get currentCurrency => theNewJob['currency'];
  bool get isEdit => _isEdit;
  Map<int, JobService> get jobs => _jobs;
  bool get isValid =>
      theNewJob['name'].isNotEmpty && theNewJob['currency'].length == 1;

  List<Map<String, dynamic>> get jobList =>
      jobs.entries.map((MapEntry e) => {'k': e.key, 'v': e.value}).toList();

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

  set theNewJob(Map<String, dynamic> newJob) {
    _theNewJob = newJob;
    notifyListeners();
  }

  set jobs(Map<int, JobService> jobs) {
    _jobs = jobs;
    notifyListeners();
  }

  set selectedKey(int key) {
    _selectedKey = key;
    StorageManager.saveData(selectedJobKey, key);
    notifyListeners();
  }

  // #endregion getters / setters
}
