import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/country_bloc.dart';
import 'repositories/country_repository.dart';
import 'screens/home_screen.dart';

void main() {
  // In main.dart, disable excessive logs:
  debugPrint = (String? message, {int? wrapWidth}) {};
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryBloc(CountryRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'African Countries',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
