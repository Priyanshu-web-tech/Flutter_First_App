import 'package:flutter/material.dart';
import 'package:my_first_app/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set this to false
      title: "Flutter Learn",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomeView(),
    );
  }
}
