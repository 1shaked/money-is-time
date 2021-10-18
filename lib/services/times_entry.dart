import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
part 'times_entry.g.dart';

@HiveType(typeId: 2)
class TimesEntry with ChangeNotifier {
  @HiveField(0)
  int _monthStartDate = 1;
  @HiveField(1)
  int _dayOfWeekStart = 1;

  int get monthStartDate => _monthStartDate;
  int get dayOfWeekStart => _dayOfWeekStart;

  set monthStartDate(int v) {
    _monthStartDate = v;
    notifyListeners();
  }

  set dayOfWeekStart(int v) {
    dayOfWeekStart = v;
    notifyListeners();
  }
}
