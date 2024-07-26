import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/place_form_screen.dart';
import 'package:great_places/screens/places_list_screen.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final ThemeData theme = ThemeData();

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: Colors.amber, primary: Colors.indigo),
        ),
        home: const PlacesListScreen(),
        routes: {
          AppRoutes.place_form: (ctx) => const PlaceFormScreen(),
        },
      ),
    );
  }
}
