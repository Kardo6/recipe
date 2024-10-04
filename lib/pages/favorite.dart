import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/components/card.dart';
import 'package:recipe/home.dart';
import 'package:recipe/main.dart';
import 'package:recipe/pages/create.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      drawer: Drawer(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 100.0,
              color: Colors.green,
              child: Center(
                child: Text(
                  'Recipe App',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Favorites'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Favorite(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Create New Recipe'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CreateRecipe(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: appState.favorites.length,
        itemBuilder: (context, index) {
          var food = appState.favorites[index];
          return FoodCard(
            food: food,
            imageUrl: food.imageUrl,
            foodName: food.name,
            foodDescription: food.description,
            foodTime: food.time,
            recipeCount: food.recipe.ingredients.length,
          );
        },
      ),
    );
  }
}
