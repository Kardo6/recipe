import 'package:flutter/material.dart';
import 'package:recipe/home.dart';
import 'package:recipe/pages/create.dart';
import 'package:recipe/pages/favorite.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
