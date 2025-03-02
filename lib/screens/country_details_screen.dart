import 'package:flutter/material.dart';
import '../models/country_model.dart';

class CountryDetailsScreen extends StatelessWidget {
  final Country country;

  CountryDetailsScreen({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(country.name)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(country.flag, width: 200),
            SizedBox(height: 10),
            Text("Capital: ${country.capital}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Languages: ${country.languages}", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
