import 'package:recipe/data/storage.dart';
import 'package:recipe/models/recipe.dart';

class Food {
  String name;
  String description;
  Recipe recipe;
  String category;
  String imageUrl;
  int time;

  Food({
    required this.name,
    required this.description,
    required this.recipe,
    required this.category,
    required this.imageUrl,
    required this.time,
  });
}

List<Food> foods = [
  Food(
    name: 'Grilled Steak with Asparagus',
    description:
        'A hearty main dish featuring a perfectly grilled steak served with a side of sautéed asparagus, garlic, and a touch of butter for extra flavor.',
    recipe: Recipe(
      ingredients: [
        '1 steak (ribeye, sirloin, or choice cut)',
        'Salt and pepper',
        'Olive oil',
        '1 bunch asparagus',
        'Garlic, minced',
        'Butter for basting',
      ],
      instructions: [
        'Season the steak with salt, pepper, and a bit of olive oil.',
        'Heat a grill or cast-iron skillet over high heat.',
        'Grill the steak for about 4-5 minutes on each side for medium-rare, or adjust based on desired doneness.',
        'In a separate pan, sauté the asparagus with olive oil, garlic, and a pinch of salt.',
        'Serve the steak with butter and garlic drizzled over, and asparagus on the side.',
      ],
    ),
    category: 'Main Dish',
    imageUrl: 'assets/foods/food1.jpg',
    time: 45,
  ),
  Food(
    name: 'Grilled Chicken with Pesto Garnish',
    description:
        'Tender grilled chicken topped with fresh pesto, served with optional roasted or grilled potatoes for a satisfying meal.',
    recipe: Recipe(
      ingredients: [
        '2 chicken breasts or thighs',
        'Olive oil',
        'Salt and pepper',
        '1/4 cup pesto (store-bought or homemade)',
        'Potatoes (optional side)',
      ],
      instructions: [
        'Preheat a grill or pan over medium heat.',
        'Brush chicken with olive oil, season with salt and pepper, and grill until fully cooked (about 6-7 minutes per side).',
        'Top with a spoonful of pesto before serving.',
        'Serve alongside roasted or grilled potatoes if desired.',
      ],
    ),
    category: 'Main Dish',
    imageUrl: 'assets/foods/food2.jpg',
    time: 15,
  ),
  Food(
    name: 'Avocado and Radish Salad',
    description:
        'A light and refreshing salad featuring creamy avocado, crisp radishes, and cucumber, topped with a lemon-olive oil dressing.',
    recipe: Recipe(
      ingredients: [
        '2 avocados, diced',
        '5-6 radishes, sliced',
        '1 cucumber, sliced',
        'Olive oil',
        'Lemon juice',
        'Salt and pepper',
      ],
      instructions: [
        'Combine diced avocado, radishes, and cucumber in a bowl.',
        'Drizzle with olive oil and a squeeze of lemon juice.',
        'Season with salt and pepper to taste and toss gently.',
      ],
    ),
    category: 'Salad',
    imageUrl: 'assets/foods/food3.jpg',
    time: 20,
  ),
  Food(
    name: 'Honey Lemon Iced Tea',
    description:
        'A sweet and tangy iced tea made with black or green tea, honey, and fresh lemon slices, perfect for a hot day.',
    recipe: Recipe(
      ingredients: [
        '4 cups brewed tea (black or green)',
        '1/4 cup honey',
        '1 lemon, sliced',
        'Ice cubes'
      ],
      instructions: [
        'Brew your tea and allow it to cool slightly.',
        'Stir in honey while the tea is warm, then add lemon slices.',
        'Let the tea chill in the fridge and serve over ice.'
      ],
    ),
    category: 'Beverage',
    imageUrl: 'assets/foods/food4.jpg',
    time: 25,
  ),
  Food(
    name: 'Cake with Berries',
    description:
        'A delicious and easy dessert with a soft cake base, fluffy whipped cream, and a topping of mixed fresh berries.',
    recipe: Recipe(
      ingredients: [
        '1 cake base (store-bought or homemade sponge)',
        'Whipped cream',
        'Mixed berries (strawberries, raspberries, blueberries)',
        'Mint leaves for garnish'
      ],
      instructions: [
        'Place the cake base on a serving plate.',
        'Spread whipped cream evenly over the cake.',
        'Top with a generous amount of mixed berries and garnish with mint leaves.'
      ],
    ),
    category: 'Dessert',
    imageUrl: 'assets/foods/food5.jpg',
    time: 30,
  ),
  Food(
    name: 'Buttered Popcorn',
    description:
        'Classic homemade popcorn drizzled with melted butter and sprinkled with salt for a quick and tasty snack.',
    recipe: Recipe(
      ingredients: [
        '1/2 cup popcorn kernels',
        '2-3 tablespoons butter, melted',
        'Salt to taste'
      ],
      instructions: [
        'Heat a pot with a tight-fitting lid over medium heat, adding 1-2 tablespoons of oil.',
        'Add popcorn kernels, cover, and let them pop, shaking occasionally.',
        'Once popping slows, remove from heat and drizzle melted butter over the popcorn.',
        'Sprinkle with salt to taste.',
      ],
    ),
    category: 'Side',
    imageUrl: 'assets/foods/food6.jpg',
    time: 10,
  ),
  Food(
    name: 'Salad with Greens, Avocado, and Seeds',
    description:
        'A healthy salad with mixed greens, creamy avocado slices, and crunchy seeds, dressed with olive oil and balsamic vinegar.',
    recipe: Recipe(
      ingredients: [
        'Mixed greens (arugula, spinach, lettuce)',
        '1 avocado, sliced',
        'Pumpkin or sunflower seeds',
        'Olive oil and balsamic vinegar dressing',
      ],
      instructions: [
        'Toss mixed greens in a bowl with olive oil and balsamic vinegar.',
        'Add sliced avocado and sprinkle with seeds for texture.',
        'Serve immediately.',
      ],
    ),
    category: 'Salad',
    imageUrl: 'assets/foods/food7.jpg',
    time: 15,
  ),
  Food(
    name: 'Crudités with Vegetables and Dips',
    description:
        'A fresh and healthy platter of sliced vegetables served with your choice of hummus or ranch dip for a light appetizer or snack.',
    recipe: Recipe(
      ingredients: [
        'Carrot sticks',
        'Celery sticks',
        'Cucumber slices',
        'Bell peppers, sliced',
        '1 cup hummus or ranch dip',
      ],
      instructions: [
        'Arrange sliced vegetables on a platter.',
        'Serve with hummus or ranch dip on the side.'
      ],
    ),
    category: 'Side',
    imageUrl: 'assets/foods/food8.jpg',
    time: 5,
  ),
];

List<String> categories = [
  'Main Dish',
  'Salad',
  'Beverage',
  'Dessert',
  'Side',
];

