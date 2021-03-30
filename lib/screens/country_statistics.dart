import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'chart.dart';

import '../utils/constants.dart';

import '../models/country_summary.dart';
import '../models/time_series_cases.dart';

class CountryStatistics extends StatelessWidget {
  final List<CountrySummaryModel> summaryList;

  CountryStatistics({@required this.summaryList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildCard(
          "CONFIRMED",
          summaryList[summaryList.length - 1].confirmed,
          Color.fromARGB(255, 255, 1, 1),
          "ACTIVE",
          summaryList[summaryList.length - 1].active,
          Color.fromARGB(255, 222, 56, 56),
        ),
        buildCard(
          "RECOVERED",
          summaryList[summaryList.length - 1].recovered,
          Colors.green,
          "DEATH",
          summaryList[summaryList.length - 1].death,
          Colors.black87,
        ),
        buildCardChart(summaryList),
      ],
    );
  }

  Widget buildCard(String leftTitle, int leftValue, Color leftColor,
      String rightTitle, int rightValue, Color rightColor) {
    return Card(
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  leftTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  leftValue.toString().replaceAllMapped(reg, mathFunc),
                  style: TextStyle(
                    color: leftColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  rightTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  rightValue.toString().replaceAllMapped(reg, mathFunc),
                  style: TextStyle(
                    color: rightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardChart(List<CountrySummaryModel> summaryList) {
    return Card(
      elevation: 1,
      child: Container(
        height: 190,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Chart(
          _createData(summaryList),
          animate: false,
        ),
      ),
    );
  }

  static List<charts.Series<TimeSeriesCases, DateTime>> _createData(
      List<CountrySummaryModel> summaryList) {
    List<TimeSeriesCases> confirmedData = [];
    List<TimeSeriesCases> activeData = [];
    List<TimeSeriesCases> recoveredData = [];
    List<TimeSeriesCases> deathData = [];

    for (var item in summaryList) {
      confirmedData.add(TimeSeriesCases(item.date, item.confirmed));
      activeData.add(TimeSeriesCases(item.date, item.active));
      recoveredData.add(TimeSeriesCases(item.date, item.recovered));
      deathData.add(TimeSeriesCases(item.date, item.death));
    }

    return [
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Confirmed',
        colorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(Color.fromARGB(255, 255, 1, 1)),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: confirmedData,
      ),
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Active',
        colorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(Color.fromARGB(255, 222, 56, 56)),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: activeData,
      ),
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Recovered',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.green),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: recoveredData,
      ),
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Death',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.black),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: deathData,
      ),
    ];
  }
}
