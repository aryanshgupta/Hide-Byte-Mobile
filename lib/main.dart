import 'package:flutter/material.dart';
import 'package:hide_byte/constant.dart';
import 'screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HideBytes',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "GoogleSans",
        useMaterial3: true,
        appBarTheme: AppBarTheme(color: colorDark),
        scaffoldBackgroundColor: colorDark,
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: colorDark,
          indicatorColor: Colors.blue.shade200,
          labelTextStyle: MaterialStateProperty.all(TextStyle(color: colorTextLight)),
        ),
        primarySwatch: MaterialColor(
          0xFF7CC4FC,
          const <int, Color>{
            50: Color(0xFF7CC4FC),
            100: Color(0xFF7CC4FC),
            200: Color(0xFF7CC4FC),
            300: Color(0xFF7CC4FC),
            400: Color(0xFF7CC4FC),
            500: Color(0xFF7CC4FC),
            600: Color(0xFF7CC4FC),
            700: Color(0xFF7CC4FC),
            800: Color(0xFF7CC4FC),
            900: Color(0xFF7CC4FC),
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
