// To parse this JSON data, do
//
//     final countriesModel = countriesModelFromJson(jsonString);

import 'dart:convert';

List<CountriesModel> countriesModelFromJson(String str) => List<CountriesModel>.from(
    json.decode(str).map((x) => CountriesModel.fromJson(x)));

String countriesModelToJson(List<CountriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountriesModel {
  CountriesModel({
    required this.flags,
    required this.name,
    required this.capital,
  });

  Flags flags;
  Name name;
  String capital;

  factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
        flags: Flags.fromJson(json["flags"]),
        name: Name.fromJson(json["name"]),
        capital: json["capital"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "flags": flags.toJson(),
        "name": name.toJson(),
        "capital": capital,
      };
}

class Flags {
  Flags({
    required this.png,
  });

  String png;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
      };
}

class Name {
  Name({
    required this.common,
    required this.official,
  });

  String common;
  String official;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
      };
}