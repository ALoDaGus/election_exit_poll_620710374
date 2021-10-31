import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/election_page.dart';
import 'pages/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Election',
      theme: ThemeData(
        fontFamily: GoogleFonts.prompt().fontFamily,
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 22.0,),
            bodyText2: TextStyle(fontSize: 18.0)),
      ),
      home: ElectionPage(),
      routes: {
        ElectionPage.routeName: (context) => const ElectionPage(),
        ResultPage.routeName: (context) => const ResultPage(),
      },
    );
  }
}
