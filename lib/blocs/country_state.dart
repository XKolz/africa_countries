import 'package:flutter/foundation.dart';
import '../models/country_model.dart'; // ✅ Import the Country model

abstract class CountryState {}

class CountryLoading extends CountryState {}

class CountryLoaded extends CountryState {
  final List<Country> countries; // ✅ Now Country is recognized
  CountryLoaded(this.countries);
}

class CountryDetailsLoaded extends CountryState {
  final Country country; // ✅ Now Country is recognized
  CountryDetailsLoaded(this.country);
}

class CountryError extends CountryState {
  final String message;
  CountryError(this.message);
}
