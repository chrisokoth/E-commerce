import 'package:flutter/material.dart';

import 'pages/intro_page.dart';
import 'package:device_preview/device_preview.dart';


void main() {
  runApp(DevicePreview(
    enabled: true, // Set to `true` to enable Device Preview
    builder: (context) =>  MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
       debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true, // This enables DevicePreview's media queries
      locale: DevicePreview.locale(context), // Use the locale from DevicePreview
      builder: DevicePreview.appBuilder, // Wrap with DevicePreview's builder
      home: IntroPage(),
    );
  }
}