import 'package:flutter/material.dart';

class JobService with ChangeNotifier {
  late String _name;
  late int _rate;
  late String _currentcy;
  late bool _paidBreaks;
  late bool _presentBreaks;
  late String _location;
  JobService() {
    name = '';
    rate = 100;
    currentcy = '₪';
    paidBreaks = false;
    presentBreaks = false;
    location = '';
  }

  createJob() {
    // make a call to the data base to create job
  }

  set name(String nameString) {
    name = nameString;
    notifyListeners();
  }

  set rate(int rate) {
    this.rate = rate;
    notifyListeners();
  }

  set currentcy(String currentcy) {
    this.currentcy = currentcy;
    notifyListeners();
  }

  set paidBreaks(bool paidBreaks) {
    this.paidBreaks = paidBreaks;
    notifyListeners();
  }

  set presentBreaks(bool presentBreaks) {
    this.presentBreaks = presentBreaks;
    notifyListeners();
  }

  set location(String location) {
    this.location = location;
    notifyListeners();
  }

  String get name => _name;
  int get rate => _rate;
  String get currentcy => _currentcy;
  bool get paidBreaks => _paidBreaks;
  bool get presentBreaks => _presentBreaks;
  String get location => _location;
/*
  factory JobService.fromJson(Map<String, Object> json) {
    return JobService(
        json['name'].toString(),
        int.parse(json['rate'].toString()),
        json['currentcy'].toString(),
        json['paidBreaks'].toString() == 'true',
        json['presentBreaks'].toString() == 'true',
        json['location'].toString());
  }
 */

  Map<String, dynamic> toHiveJson() {
    return {
      'name': name,
      'rate': rate,
      'currentcy': currentcy,
      'paidBreaks': paidBreaks.toString(),
      'presentBreaks': presentBreaks.toString(),
      'location': location,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'rate': rate,
      'currentcy': currentcy,
      'paidBreaks': paidBreaks,
      'presentBreaks': presentBreaks,
      'location': location,
    };
  }
}
