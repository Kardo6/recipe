// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:recipe/main.dart';
import 'package:recipe/models/food.dart';

class FoodPage extends StatefulWidget {
  Food food;
  String foodName;
  String imageUrl;
  String category;
  int cookTime;
  List<String> ingredients;
  List<String> instructions;

  FoodPage({
    Key? key,
    required this.food,
    required this.foodName,
    required this.imageUrl,
    required this.category,
    required this.cookTime,
    required this.ingredients,
    required this.instructions,
  }) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    bool fromAssets = widget.imageUrl.split('assets') == true;

    Widget displayImage() {
      if (fromAssets) {
        return Image.asset(
          widget.imageUrl,
          height: 400.0,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        );
      }

      return Image.file(
        File(widget.imageUrl),
        height: 400.0,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      );
    }

    var appState = context.watch<AppNotifier>();
    var condition =
        appState.favorites.where((element) => element == widget.food);
    if (condition.length != 0) {
      setState(() {
        pressed = true;
      });
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.foodName),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 30.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.foodName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.timer),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          widget.cookTime.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text('mins'),
                      ],
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Row(
                      children: [
                        Icon(Icons.flatware),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          widget.ingredients.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text('ingredients'),
                      ],
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Row(
                      children: [
                        Icon(Icons.info),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          widget.instructions.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text('instructions'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 200.0,
                right: 200.0,
                top: 50.0,
                bottom: 30.0,
              ),
              child: Stack(
                children: [
                  displayImage(),
                  Positioned(
                    right: 10.0,
                    top: 10.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red[200],
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      width: 75.0,
                      height: 75.0,
                      child: IconButton(
                        color: Colors.red,
                        onPressed: () {
                          setState(() {
                            pressed = !pressed;
                          });
                          var condition = appState.favorites
                              .where((element) => element == widget.food);
                          if (condition.length != 0) {
                            appState.removeFavorite(widget.food);
                          } else {
                            appState.newFavorite(widget.food);
                          }
                        },
                        icon: pressed == false
                            ? Icon(Icons.favorite_border)
                            : Icon(Icons.favorite),
                        iconSize: 50.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 200.0,
                right: 200.0,
              ),
              child: Container(
                color: Color.fromRGBO(244, 243, 243, 1),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Text(
                        'Ingredients',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.ingredients.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Text(
                                (index + 1).toString(),
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                widget.ingredients[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 5.0,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 200.0,
                right: 200.0,
              ),
              child: Container(
                color: Color.fromRGBO(244, 243, 243, 1),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Text(
                        'Instructions',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.instructions.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Text(
                                (index + 1).toString(),
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Flexible(
                                child: Text(
                                  widget.instructions[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 5.0,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
