// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_function_literals_in_foreach_calls, curly_braces_in_flow_control_structures, prefer_final_fields, prefer_typing_uninitialized_variables

import 'package:contries_app/models/countries_model.dart';

import 'package:contries_app/screens/country_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:internet_popup/internet_popup.dart';

import '../components/filter_modal_sheet.dart';
import '../components/language_modal_sheet.dart';
import '../models/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  List<CountriesModel>? countries = [];
  List regionList = [];
  bool loaded = false;
  

  @override
  void initState() {
    super.initState();
    getCountry();
  }

  getCountry() async {
    countries = await ApiService().getContries();
    var items;
    items = countries;
    for (var element in items) {
      regionList.add(element.region);
    }
    regionList = [
      ...{...regionList}
    ];

    if (countries != null) {
      setState(() {
        loaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    countries?.sort(((a, b) => a.name!.common!.compareTo(b.name!.common!)));
    regionList.sort(((a, b) => a.compareTo(b)));
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 18,
            ),
            TextField(
                controller: controller,
                onChanged: onSearch,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).primaryColor,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(4)),
                    hintText: 'Search Country',
                    prefixIcon: Icon(Icons.search_rounded))),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 24),
                          child: SingleChildScrollView(
                            child: LanguageModalSheet(),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.language_rounded),
                        SizedBox(
                          width: 7,
                        ),
                        Text('EN')
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 24),
                          child: SingleChildScrollView(
                            child: FilterModalSheet(
                              regions: regionList,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.filter_alt_rounded),
                        SizedBox(
                          width: 7,
                        ),
                        Text('Filter')
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Visibility(
                visible: loaded,
                replacement: Center(child: CircularProgressIndicator()),
                child: _searchCountries.isNotEmpty
                    ? ListView.builder(
                        itemCount: _searchCountries.length,
                        itemBuilder: (context, index) {
                          final country = _searchCountries[index];
                          return SizedBox(
                            height: 70,
                            child: ListTile(
                              title: Text(
                                country.name!.common!,
                              ),
                              subtitle: Text(
                                country.capital![0],
                              ),
                              leading: SizedBox(
                                height: 40,
                                width: 40,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    "${country.flags!.png}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CountryDetails(
                                          country: country,
                                        )));
                              },
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: countries?.length,
                        itemBuilder: (context, index) {
                          final country = countries![index];
                          return SizedBox(
                            height: 70,
                            child: ListTile(
                              title: Text(
                                country.name!.common!,
                              ),
                              subtitle: Text(
                                country.capital![0],
                              ),
                              leading: SizedBox(
                                height: 40,
                                width: 40,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    "${country.flags!.png}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CountryDetails(
                                          country: country,
                                        )));
                              },
                            ),
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  onSearch(String search) async {
    _searchCountries.clear();
    if (search.isEmpty) {
      setState(() {});
      return;
    }

    countries!.forEach((element) {
      if (element.name!.common!.toLowerCase().contains(search.toLowerCase()))
        _searchCountries.add(element);
    });
    setState(() {});
  }

  List<CountriesModel> _searchCountries = [];
}
