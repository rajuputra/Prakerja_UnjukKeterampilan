import 'package:flutter/material.dart';
import 'package:prakerja_ta/pages/home_page.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi To-Do List',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF9395D3, <int, Color>{
          50: Color(0xFFEDEEF7),
          100: Color(0xFFD3D5EC),
          200: Color(0xFFB8BADF),
          300: Color(0xFF9D9FCD),
          400: Color(0xFF9395D3),
          500: Color(0xFF888BDA),
          600: Color(0xFF7E81D0),
          700: Color(0xFF7477D7),
          800: Color(0xFF6A6DD0),
          900: Color(0xFF6063D0),
        }),
      ),
      home: TodoListScreen(),
    );
  }
}
