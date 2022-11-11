import 'package:flutter/material.dart';

import '../models/countries_model.dart';

class CountryDetails extends StatelessWidget {
  final CountriesModel country;
  const CountryDetails({super.key, required this.country});

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
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          child: Column(
            children: [
              Container(
                width: width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "${country.flags!.png}",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Text("${country.car!.side}")
            ],
          ),
        ));
  }
}
