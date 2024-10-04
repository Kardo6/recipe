import 'package:flutter/material.dart';
import 'package:recipe/components/card.dart';
import 'package:recipe/components/categories.dart';
import 'package:recipe/components/drawer.dart';
import 'package:recipe/models/food.dart';
import 'package:recipe/pages/create.dart';
import 'package:recipe/pages/favorite.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Categories(),
      ),
      drawer: DrawerNav(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 0,
          bottom: 10.0,
          left: 20.0,
          right: 20.0,
        ),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: foods.length,
          itemBuilder: (context, index) {
            return FoodCard(
              imageUrl: foods[index].imageUrl,
              foodName: foods[index].name,
              foodDescription: foods[index].description,
              foodTime: foods[index].time,
              recipeCount: foods[index].recipe.ingredients.length,
              food: foods[index],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 20,
            );
          },
        ),
      ),
    );
  }
}
