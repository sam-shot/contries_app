// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25, fontFamily: 'Pacifico'),
                    ),
                    Icon(Icons.wb_sunny_outlined)
                  ],
                ),
              ),
              TextField(

              )
            ],
          ),
        ),
      ),
    );
  }
}
