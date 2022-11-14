// ignore_for_file: body_might_complete_normally_nullable

import 'package:http/http.dart' as http;

import 'package:contries_app/models/countries_model.dart';

class ApiService {
  Future<List<CountriesModel>?> getContries() async {
    var client = http.Client();

    var url = Uri.parse('https://restcountries.com/v3.1/all');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return countriesModelFromJson(json);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
