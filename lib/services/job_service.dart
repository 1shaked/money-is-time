import 'package:flutter/material.dart';

class JobService with ChangeNotifier {
  String _name = '';
  int _rate = 100;
  String _currency = '₪';
  bool _paidBreaks = false;
  bool _presentBreaks = false;
  String _location = '';

  createJob() {
    // make a call to the data base to create job
  }
  void setByName(String name, dynamic value) {
    print(value);
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

  String get name => _name;
  int get rate => _rate;
  String get currency => _currency;
  bool get paidBreaks => _paidBreaks;
  bool get presentBreaks => _presentBreaks;
  String get location => _location;
/*
  factory JobService.fromJson(Map<String, Object> json) {
    return JobService(
        json['name'].toString(),
        int.parse(json['rate'].toString()),
        json['currency'].toString(),
        json['paidBreaks'].toString() == 'true',
        json['presentBreaks'].toString() == 'true',
        json['location'].toString());
  }
 */

  Map<String, dynamic> toHiveJson() {
    return {
      'name': name,
      'rate': rate,
      'currency': currency,
      'paidBreaks': paidBreaks.toString(),
      'presentBreaks': presentBreaks.toString(),
      'location': location,
    };
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
