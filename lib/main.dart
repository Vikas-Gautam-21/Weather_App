import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double temperature = 0.0;
  String description = '';
  String cityName = 'Mumbai';

  Future<void> fetchWeatherData() async {
    const String apiKey = 'a838d3e1dad91b5b21c3eed084e8bc14';
    const String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';
    final uri = Uri.parse('$apiUrl?q=$cityName&appid=$apiKey&units=metric');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        temperature = data['main']['temp'];
        description = data['weather'][0]['description'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'City: $cityName',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Text(
                'Temperature: $temperature °C',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Text(
                'Description: $description',
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
