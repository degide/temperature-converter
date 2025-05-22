import 'package:flutter/material.dart';
import 'package:temperature_converter/screens/converter_screen.dart';

void main() {
  runApp(const TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          toolbarHeight: 50,
        )
      ),
      debugShowCheckedModeBanner: false,
      home: const TemperatureConverterScreen(),
    );
  }
}
