// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:recipe/models/food.dart';
import 'package:recipe/pages/food_page.dart';

class FoodCard extends StatefulWidget {
  Food food;
  String imageUrl;
  String foodName;
  String foodDescription;
  int foodTime;
  int recipeCount;

  FoodCard({
    Key? key,
    required this.food,
    required this.imageUrl,
    required this.foodName,
    required this.foodDescription,
    required this.foodTime,
    required this.recipeCount,
  }) : super(key: key);

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    bool fromAssets = widget.imageUrl.split('assets') == true;

    Widget displayImage() {
      if (fromAssets) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            widget.imageUrl,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        );
      }

      return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.file(
          File(widget.imageUrl),
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      );
    }

    return SizedBox(
      height: 200,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FoodPage(
                foodName: widget.foodName,
                imageUrl: widget.imageUrl,
                category: widget.food.category,
                cookTime: widget.foodTime,
                ingredients: widget.food.recipe.ingredients,
                instructions: widget.food.recipe.instructions,
                food: widget.food,
              ),
            ),
          );
        },
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                displayImage(),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${widget.foodTime} Min',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            '${widget.recipeCount} Ingredients',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                          widget.foodDescription,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
