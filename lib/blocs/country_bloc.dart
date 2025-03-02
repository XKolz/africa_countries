import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/country_repository.dart';
import '../models/country_model.dart';
import 'country_event.dart';
import 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryRepository countryRepository;

  CountryBloc(this.countryRepository) : super(CountryLoading()) {
    on<FetchCountries>((event, emit) async {
      try {
        final countries = await countryRepository.fetchCountries();
        emit(CountryLoaded(countries));
      } catch (e) {
        emit(CountryError("Failed to fetch countries"));
      }
    });

    on<FetchCountryDetails>((event, emit) async {
      try {
        final country = await countryRepository.fetchCountryDetails(event.countryName);
        emit(CountryDetailsLoaded(country));
      } catch (e) {
        emit(CountryError("Failed to fetch country details"));
      }
    });
  }
}
