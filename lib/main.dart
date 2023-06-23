import 'package:flutter/material.dart';
import 'tutorials_list.dart';
import "package:google_fonts/google_fonts.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "FreeCodeCamp Clone",
        theme: ThemeData(
          fontFamily: GoogleFonts.firaCode()
              .fontFamily, // Set your desired font family here
        ),
        initialRoute: "/",
        routes: {
          '/': (context) => const TutorialList(),
          //'/codeRadio': (context) => CodeRadio(),
          //'/learn': (context) => Learn(),
          //'/podcast': (context) => Podcast(),
        });
  }
}
