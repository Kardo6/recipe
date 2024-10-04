import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_windows/image_picker_windows.dart';
import 'package:recipe/components/drawer.dart';
import 'package:recipe/home.dart';
import 'package:recipe/models/food.dart';
import 'package:recipe/models/recipe.dart';

class CreateRecipe extends StatefulWidget {
  const CreateRecipe({super.key});

  @override
  State<CreateRecipe> createState() => _CreateRecipeState();
}

class _CreateRecipeState extends State<CreateRecipe> {
  List _controllers = [];
  List _formKeys = [];

  TextEditingController ingredientsController = TextEditingController();
  TextEditingController instructionsController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  List<String> ingredientsList = [];
  List<String> instructionsList = [];

  XFile? image;

  Future<XFile?> pickImage(ImageSource source) async {
    final imagePicker = ImagePickerWindows();
    final pickedFile = await imagePicker.getImageFromSource(source: source);

    return pickedFile;
  }

  Widget displayImage(XFile? pickedFile) {
    if (pickedFile != null) {
      return Image.file(
        File(pickedFile.path),
        width: MediaQuery.of(context).size.width,
        height: 300,
        fit: BoxFit.cover,
      );
    } else {
      return Text('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Recipe'),
      ),
      drawer: DrawerNav(),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 25.0,
              left: 200.0,
            ),
            child: Text(
              'Create New Recipe',
              style: TextStyle(
                fontSize: 30.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 25.0,
              left: 200.0,
              right: 200.0,
            ),
            child: Form(
              child: Column(
                children: [
                  const SizedBox(
                    height: 25.0,
                  ),
                  displayImage(image),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.info),
                      hintText: 'Name of your Recipe',
                      labelText: 'Name *',
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.description),
                      hintText: 'Description of your Recipe',
                      labelText: 'Description *',
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    controller: timeController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.schedule),
                      hintText: 'Cook Time',
                      labelText: 'Cook Time *',
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    controller: categoryController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.category),
                      hintText: 'Category',
                      labelText: 'Category *',
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () async {
                      var pickedImg = await pickImage(ImageSource.gallery);
                      setState(() {
                        image = pickedImg;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Upload an Image',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Ingredients',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: ingredientsList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Text(
                            '${index + 1}. ',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ingredientsList[index],
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10.0,
                      );
                    },
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    controller: ingredientsController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.schedule),
                      hintText: 'Ingredient',
                      labelText: 'Add Ingredient *',
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      String newIngredient = ingredientsController.text;
                      ingredientsController.text = '';

                      setState(() {
                        ingredientsList.add(newIngredient);
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Add Ingredient',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Instructions',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: instructionsList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Text(
                            '${index + 1}. ',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            instructionsList[index],
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10.0,
                      );
                    },
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    controller: instructionsController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.schedule),
                      hintText: 'Instruction',
                      labelText: 'New Instruction *',
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      String newInstruction = instructionsController.text;
                      instructionsController.text = '';

                      setState(() {
                        instructionsList.add(newInstruction);
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Add Instruction',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      Recipe recipe = Recipe(
                          ingredients: ingredientsList,
                          instructions: instructionsList);

                      Food food = Food(
                        name: nameController.text,
                        description: descriptionController.text,
                        recipe: recipe,
                        category: categoryController.text,
                        imageUrl: image!.path,
                        time: int.parse(timeController.text),
                      );

                      foods.add(food);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Add New Recipe',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
