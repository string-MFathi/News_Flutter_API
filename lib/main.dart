import 'package:flutter/material.dart';
import 'widget/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
