// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:contries_app/models/countries_model.dart';
import 'package:flutter/material.dart';

import '../models/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CountriesModel>? countries;
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    getCountry();
  }

  getCountry() async {
    countries = await ApiService().getContries();

    if (countries != null) {
      setState(() {
        loaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    countries?.sort(((a, b) => a.name.common.compareTo(b.name.common)));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Explore",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: 'Pacifico'),
                    ),
                    Icon(Icons.wb_sunny_outlined)
                  ],
                ),
              ),
              TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(4)),
                      hintText: 'Search',
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
                          return Container();
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
                  child: ListView.builder(
                    itemCount: countries?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: SizedBox(
                          height: 70,
                          child: ListTile(
                            title: Text(
                              countries![index].name.common,
                            ),
                            subtitle: Text(
                              countries![index].capital,
                            ),
                            leading: SizedBox(
                              height: 40,
                              width: 40,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  countries![index].flags.png,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
