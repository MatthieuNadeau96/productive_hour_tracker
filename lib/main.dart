import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productive_hour_tracker/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xffFCF5EB),
      ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xffFCF5EB),
          elevation: 1,
          brightness: Brightness.light,
          centerTitle: true,
        ),
        primaryColor: Color(0xffF06E1E),
        primaryColorDark: Color(0xffF58B44),
        primaryColorLight: Color(0xffF4E6D5), // lighter  canvas color
        canvasColor: Color(0xffFCF5EB),
        accentColor: Color(0xff0572F4),
        iconTheme: IconThemeData(
          color: Color(0xff5A6175),
        ),
        primaryIconTheme: IconThemeData(
          color: Color(0xff5A6175),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryTextTheme: TextTheme(
          headline1: TextStyle(
            color: Color(0xff5A6175),
          ),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
