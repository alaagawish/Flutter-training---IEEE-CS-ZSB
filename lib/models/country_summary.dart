class CountrySummaryModel {
  final String country;
  final DateTime date;
  final int confirmed, active, death, recovered;

  CountrySummaryModel(this.country, this.confirmed, this.death, this.recovered,
      this.active, this.date);

  factory CountrySummaryModel.fromJson(Map<String, dynamic> json) {
    return CountrySummaryModel(
      json["Country"],
      json["Confirmed"],
      json["Deaths"],
      json["Recovered"],
      json["Active"],
      DateTime.parse(json["Date"]),
    );
  }
}
