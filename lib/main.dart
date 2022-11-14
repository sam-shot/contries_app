// ignore_for_file: prefer_const_constructors

import 'package:contries_app/provider/theme_data.dart';
import 'package:contries_app/screens/home_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDark ? MyTheme.darkTheme : MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              "Explore",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: 'Pacifico'),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isDark = !isDark;
                    });
                  },
                  child: isDark ?   Icon(Icons.dark_mode_rounded) :Icon(Icons.wb_sunny_outlined)),
            )
          ],
        ),
        body: HomePage(),
      ),
    );
  }
}
