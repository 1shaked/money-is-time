class Job {
  String name;
  int rate;
  String currentcy;
  bool paidBreaks;
  bool presentBreaks;
  String location;
  Job(this.name, this.rate, this.currentcy, this.paidBreaks, this.presentBreaks,
      this.location);

  factory Job.fromJson(Map<String, Object> json) {
    return Job(
        json['name'].toString(),
        int.parse(json['rate'].toString()),
        json['currentcy'].toString(),
        json['paidBreaks'].toString() == 'true',
        json['presentBreaks'].toString() == 'true',
        json['location'].toString());
  }

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

  Map<String, dynamic> toFirebaseJson() {
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
