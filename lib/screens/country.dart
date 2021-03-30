import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../services/covid_service.dart';

import '../screens/country_statistics.dart';
import '../models/country_summary.dart';
import '../models/country.dart';

CovidService covidService = CovidService();

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  final TextEditingController _typeAheadController = TextEditingController();
  Future<List<CountryModel>> countryList;
  Future<List<CountrySummaryModel>> summaryList;

  @override
  initState() {
    super.initState();

    countryList = covidService.getCountryList();

    this._typeAheadController.text = "Egypt";
    summaryList = covidService.getCountrySummary("egypt");
  }

  List<String> _getSuggestions(List<CountryModel> list, String query) {
    List<String> matches = List();

    for (var item in list) {
      matches.add(item.country);
    }

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: countryList,
      builder: (context, snapshot) {
        if (snapshot.hasError)
          return Center(
            child: Text("Error"),
          );
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          default:
            return !snapshot.hasData
                ? Center(
                    child: Text("Empty"),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                        child: Text(
                          "Country Name:",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: this._typeAheadController,
                          decoration: InputDecoration(
                            hintText: 'Enter Country name',
                            hintStyle: TextStyle(fontSize: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: double.infinity,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white38,
                            contentPadding: EdgeInsets.all(15),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 16.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                        suggestionsCallback: (pattern) {
                          return _getSuggestions(snapshot.data, pattern);
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion),
                          );
                        },
                        transitionBuilder:
                            (context, suggestionsBox, controller) {
                          return suggestionsBox;
                        },
                        onSuggestionSelected: (suggestion) {
                          this._typeAheadController.text = suggestion;
                          setState(() {
                            summaryList = covidService.getCountrySummary(
                                snapshot.data
                                    .firstWhere((element) =>
                                        element.country == suggestion)
                                    .slug);
                          });
                        },
                      ),
                      SizedBox(height: 6),
                      FutureBuilder(
                        future: summaryList,
                        builder: (context, snapshot) {
                          if (snapshot.hasError)
                            return Center(
                              child: Text("Error"),
                            );
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                            default:
                              return !snapshot.hasData
                                  ? Center(
                                      child: Text("Empty"),
                                    )
                                  : CountryStatistics(
                                      summaryList: snapshot.data,
                                    );
                          }
                        },
                      ),
                    ],
                  );
        }
      },
    );
  }
}
