import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/country_bloc.dart';
import '../blocs/country_event.dart';
import '../blocs/country_state.dart';
import '../widgets/country_card.dart';
import 'country_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CountryBloc>().add(FetchCountries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('African Countries')),
      body: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          if (state is CountryLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CountryLoaded) {
            return ListView.builder(
              itemCount: state.countries.length,
              itemBuilder: (context, index) {
                final country = state.countries[index];
                return CountryCard(
                  country: country,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CountryDetailsScreen(country: country)),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("Failed to load countries"));
          }
        },
      ),
    );
  }
}
