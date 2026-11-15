import 'package:assignment_three/screens/3d_screens/details_screen_3d.dart';
import 'package:assignment_three/screens/3d_screens/home_screen_3d.dart';
import 'package:assignment_three/screens/details_screen.dart';
import 'package:assignment_three/screens/entry_screen.dart';
import 'package:assignment_three/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: EntryScreen.routeName,
      routes: {
        EntryScreen.routeName: (context) => EntryScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        DetailsScreen.routeName: (context) => DetailsScreen(),
        HomeScreen3d.routeName:(context)=>HomeScreen3d(),
        DetailsScreen3d.routeName:(context) => DetailsScreen3d()
      },
    );
  }
}
