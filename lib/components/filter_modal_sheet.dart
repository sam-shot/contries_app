import 'package:flutter/material.dart';

class FilterModalSheet extends StatefulWidget {
  FilterModalSheet({
    super.key,
  });

  @override
  State<FilterModalSheet> createState() => _FilterModalSheetState();
}

class _FilterModalSheetState extends State<FilterModalSheet> {
  bool isRegion = true;

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
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Region"),
            Checkbox(
                value: isRegion,
                onChanged: (value) {
                  if (value == false) {
                    setState(() {
                      isRegion == true;
                    });
                  } else {
                    setState(() {
                      isRegion == false;
                    });
                  }
                })
          ],
        ),
      ],
    );
  }
}
