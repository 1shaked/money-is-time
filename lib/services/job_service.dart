import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
part 'job_service.g.dart';

@HiveType(typeId: 0)
class JobService extends HiveObject with ChangeNotifier {
  @HiveField(0)
  String _name = '';
  @HiveField(1)
  int _rate = 100;
  @HiveField(2)
  String _currency = '₪';
  @HiveField(3)
  bool _paidBreaks = false;
  @HiveField(4)
  bool _presentBreaks = false;
  @HiveField(5)
  String _location = '';

  JobService() {
    //
  }
  JobService.withParams(String name, int rate, String currency, bool paidBreaks,
      bool presentBreaks, String location) {
    _name = name;
    _rate = rate;
    _currency = currency;
    _paidBreaks = paidBreaks;
    _presentBreaks = presentBreaks;
    _location = location;
    notifyListeners();
  }

  createJob() async {
    // make a call to the data base to create job
    Box box = await Hive.openBox<JobService>("JobService");
    // box.put(name, this);
    box.add(this);
  }

  void setByName(String name, dynamic value) {
    switch (name) {
      case 'name':
        name = value;
        break;
      case 'rate':
        rate = value;
        break;
      case 'currency':
        currency = value;
        break;
      case 'paidBreaks':
        paidBreaks = value;
        break;
      case 'presentBreaks':
        presentBreaks = value;
        break;
      case 'location':
        location = value;
        break;
    }
    notifyListeners();
  }

  set name(String nameString) {
    _name = nameString;
    notifyListeners();
  }

  set rate(int rate) {
    _rate = rate;
    notifyListeners();
  }

  set currency(String currency) {
    _currency = currency;
    notifyListeners();
  }

  set paidBreaks(bool paidBreaks) {
    _paidBreaks = paidBreaks;
    notifyListeners();
  }

  set presentBreaks(bool presentBreaks) {
    _presentBreaks = presentBreaks;
    notifyListeners();
  }

  set location(String location) {
    _location = location;
    notifyListeners();
  }

  String toString() {
    return 'JobName $name Rate $rate';
  }

  void saveLocalJob() {
    print('save');
  }

  String get name => _name;
  int get rate => _rate;
  String get currency => _currency;
  bool get paidBreaks => _paidBreaks;
  bool get presentBreaks => _presentBreaks;
  String get location => _location;

  factory JobService.fromJson(Map<String, dynamic> json) {
    return JobService.withParams(
        json['name'].toString(),
        int.parse(json['rate'].toString()),
        json['currency'].toString(),
        json['paidBreaks'].toString().toLowerCase() == 'true',
        json['presentBreaks'].toString().toLowerCase() == 'true',
        json['location'].toString());
  }

  Map<String, dynamic> get valueJson => {
        'name': name,
        'rate': rate,
        'currency': currency,
        'paidBreaks': paidBreaks,
        'presentBreaks': presentBreaks,
        'location': location,
      };
  bool get isValid => name.isNotEmpty && currency.length == 1;
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'rate': rate,
      'currency': currency,
      'paidBreaks': paidBreaks,
      'presentBreaks': presentBreaks,
      'location': location,
    };
  }
}
