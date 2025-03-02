import 'package:flutter/material.dart';
import '../models/country_model.dart';

class CountryCard extends StatelessWidget {
  final Country country;
  final VoidCallback onTap;

  CountryCard({required this.country, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(country.flag, width: 50),
        title: Text(country.name),
        subtitle: Text('Capital: ${country.capital}'),
        onTap: onTap,
      ),
    );
  }
}
