import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipe/home.dart';
import 'package:recipe/models/food.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppNotifier(),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class AppNotifier extends ChangeNotifier {
  List<Food> favorites = [];

  void newFavorite(Food food) {
    favorites.add(food);
    notifyListeners();
  }

  void removeFavorite(Food food) {
    favorites.remove(food);
    notifyListeners();
  }
}

class _MainAppState extends State<MainApp> {
  ThemeMode themeMode = ThemeMode.light;
  final Color colorSelected = Color.fromRGBO(255, 255, 214, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        colorSchemeSeed: colorSelected,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      home: Home(),
    );
  }
}
