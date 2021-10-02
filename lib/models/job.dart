class Job {
  String name;
  int rate;
  String currency;
  bool paidBreaks;
  bool presentBreaks;
  String location;
  Job(this.name, this.rate, this.currency, this.paidBreaks, this.presentBreaks,
      this.location);

  factory Job.fromJson(Map<String, Object> json) {
    return Job(
        json['name'].toString(),
        int.parse(json['rate'].toString()),
        json['currency'].toString(),
        json['paidBreaks'].toString() == 'true',
        json['presentBreaks'].toString() == 'true',
        json['location'].toString());
  }

  Map<String, dynamic> toFirebaseJson() {
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
