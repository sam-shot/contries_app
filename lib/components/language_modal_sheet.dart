// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LanguageModalSheet extends StatelessWidget {
  const LanguageModalSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Languages",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.cancel)),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Bahasa"),
            Radio(
                value: "value",
                groupValue: "groupValue",
                onChanged: (value) {
                  Navigator.pop(context);
                })
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Deutsch"),
            Radio(
                value: "value",
                groupValue: "groupValue",
                onChanged: (value) {
                  Navigator.pop(context);
                })
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("English"),
            Radio(
                value: "value",
                groupValue: "groupValue",
                onChanged: (value) {
                  Navigator.pop(context);
                })
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Espanol"),
            Radio(
                value: "value",
                groupValue: "groupValue",
                onChanged: (value) {
                  Navigator.pop(context);
                })
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Italiano"),
            Radio(
                value: "value",
                groupValue: "groupValue",
                onChanged: (value) {
                  Navigator.pop(context);
                })
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Francais"),
            Radio(
                value: "value",
                groupValue: "groupValue",
                onChanged: (value) {
                  Navigator.pop(context);
                })
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Portugues"),
            Radio(
                value: "value",
                groupValue: "groupValue",
                onChanged: (value) {
                  Navigator.pop(context);
                })
          ],
        ),
      ],
    );
  }
}
