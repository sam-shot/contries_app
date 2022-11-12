// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable, prefer_const_constructors, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/countries_model.dart';

class CountryDetails extends StatelessWidget {
  final CountriesModel country;
  CountryDetails({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    final width, height;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(country.name!.common!),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  items: [
                    Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage("${country.flags!.png}"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage("${country.coatOfArms!.png}"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration: Duration(milliseconds: 300),
                    viewportFraction: 0.78,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                CountryProperties(
                    header1: "Abbreviation",
                    header2: "Region",
                    header3: "Sub-Region",
                    header4: "Capital",
                    value1: country.fifa!,
                    value2: country.region!,
                    value3: country.subregion!,
                    value4: country.capital![0]),
                SizedBox(
                  height: 24,
                ),
                CountryProperties(
                  header1: "Independence",
                  header2: "Continent",
                  header3: "Area",
                  header4: "Population",
                  value1: country.independent == true
                      ? "Gained Independence"
                      : "Not Independent ",
                  value2: country.continents![0],
                  value3: "${country.area} km²",
                  value4: "${country.population}",
                ),
                SizedBox(
                  height: 24,
                ),
                CountryProperties(
                    header1: "Start of Week",
                    header2: "Driving Side",
                    header3: "Time-Zones",
                    header4: "Dialing Code",
                    value1: "${country.startOfWeek}",
                    value2: "${country.car!.side}",
                    value3: country.timezones!.first,
                    value4: "${country.idd!.root}(${country.idd!.suffixes![0]})"),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ));
  }
}

class CountryProperties extends StatelessWidget {
  String header1;
  String header2;
  String header3;
  String header4;
  String value1;
  String value2;
  String value3;
  String value4;

  CountryProperties({
    super.key,
    required this.header1,
    required this.header2,
    required this.header3,
    required this.header4,
    required this.value1,
    required this.value2,
    required this.value3,
    required this.value4,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "$header1: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(value1),
          ],
        ),
        Row(
          children: [
            Text(
              "$header2: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(value2),
          ],
        ),
        Row(
          children: [
            Text(
              "$header3: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(value3),
          ],
        ),
        Row(
          children: [
            Text(
              "$header4: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(value4),
          ],
        ),
      ],
    );
  }
}
