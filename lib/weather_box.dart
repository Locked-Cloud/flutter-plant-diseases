import 'package:flutter/material.dart';

class WeatherBox extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  WeatherBox({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            weatherData['location']['name'],
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            '${weatherData['current']['temp_c']}°C',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 4),
          Text(
            weatherData['current']['condition']['text'],
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
