// ignore_for_file: must_be_immutable, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';

class FilterModalSheet extends StatefulWidget {
  List regions;
  FilterModalSheet({
    required this.regions,
    super.key,
  });

  @override
  State<FilterModalSheet> createState() => _FilterModalSheetState();
}

class _FilterModalSheetState extends State<FilterModalSheet> {
  bool? Africa = false;
  bool? Americas = false;
  bool? Europe = false;
  bool? Asia = false;
  bool? Oceania = false;
  bool? Antarctic = false;
  List<bool> expanded = [false];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filters",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.cancel)),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        widget.regions == null || widget.regions.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    expanded[index] = !isExpanded;
                  });
                },
                expandedHeaderPadding: EdgeInsets.zero,
                elevation: 0,
                children: [
                    ExpansionPanel(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text('Region'),
                        );
                      },
                      body: Column(
                        children: [
                          CheckboxListTile(
                            value: Africa,
                            onChanged: (newBool) {
                              setState(() {
                                Africa = newBool;
                              });
                            },
                            title: Text(widget.regions[0]),
                          ),
                          CheckboxListTile(
                            value: Americas,
                            onChanged: (newBool) {
                              setState(() {
                                Americas = newBool;
                              });
                            },
                            title: Text(widget.regions[1]),
                          ),
                          CheckboxListTile(
                            value: Antarctic,
                            onChanged: (newBool) {
                              setState(() {
                                Antarctic = newBool;
                              });
                            },
                            title: Text(widget.regions[2]),
                          ),
                          CheckboxListTile(
                            value: Asia,
                            onChanged: (newBool) {
                              setState(() {
                                Asia = newBool;
                              });
                            },
                            title: Text(widget.regions[3]),
                          ),
                          CheckboxListTile(
                            value: Europe,
                            onChanged: (newBool) {
                              setState(() {
                                Europe = newBool;
                              });
                            },
                            title: Text(widget.regions[4]),
                          ),
                          CheckboxListTile(
                            value: Oceania,
                            onChanged: (newBool) {
                              setState(() {
                                Oceania = newBool;
                              });
                            },
                            title: Text(widget.regions[5]),
                          ),
                        ],
                      ),
                      isExpanded: expanded[0],
                    ),
                  ]),
      ],
    );
  }
}



// Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text("Region"),
//             Checkbox(
//                 value: isRegion,
                // onChanged: (newBool) {
                //   setState(() {
                //     isRegion = newBool;
                //   });
//                 })
//           ],
//         ),